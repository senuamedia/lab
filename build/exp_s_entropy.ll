; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_s_entropy.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_s_entropy.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"logistic_S"(i64 %r) nounwind {
entry:
  %local.x.9 = alloca i64
  %local.step.10 = alloca i64
  %local.early_d.11 = alloca i64
  %local.late_d.12 = alloca i64
  %local.prev_x.13 = alloca i64
  %local.count_e.14 = alloca i64
  %local.count_l.15 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t16 = call i64 @f64_parse(ptr @.str.exp_s_entropy.2)
  store i64 %t16, ptr %local.x.9
  store i64 0, ptr %local.step.10
  %t17 = call i64 @f64_parse(ptr @.str.exp_s_entropy.3)
  store i64 %t17, ptr %local.early_d.11
  %t18 = call i64 @f64_parse(ptr @.str.exp_s_entropy.4)
  store i64 %t18, ptr %local.late_d.12
  %t19 = call i64 @f64_parse(ptr @.str.exp_s_entropy.5)
  store i64 %t19, ptr %local.prev_x.13
  store i64 0, ptr %local.count_e.14
  store i64 0, ptr %local.count_l.15
  br label %loop1
loop1:
  %t20 = load i64, ptr %local.step.10
  %t21 = icmp slt i64 %t20, 3000
  %t22 = zext i1 %t21 to i64
  %t23 = icmp ne i64 %t22, 0
  br i1 %t23, label %body1, label %endloop1
body1:
  %t24 = load i64, ptr %local.r
  %t25 = load i64, ptr %local.x.9
  %t26 = call i64 @"sx_f64_mul"(i64 %t24, i64 %t25)
  %t27 = call i64 @f64_parse(ptr @.str.exp_s_entropy.6)
  %t28 = load i64, ptr %local.x.9
  %t29 = call i64 @"sx_f64_sub"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_mul"(i64 %t26, i64 %t29)
  store i64 %t30, ptr %local.x.9
  %t31 = load i64, ptr %local.step.10
  %t32 = icmp sgt i64 %t31, 200
  %t33 = zext i1 %t32 to i64
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then2, label %else2
then2:
  %t35 = load i64, ptr %local.step.10
  %t36 = icmp slt i64 %t35, 1200
  %t37 = zext i1 %t36 to i64
  %t38 = icmp ne i64 %t37, 0
  br i1 %t38, label %then3, label %else3
then3:
  %t39 = load i64, ptr %local.early_d.11
  %t40 = load i64, ptr %local.x.9
  %t41 = load i64, ptr %local.prev_x.13
  %t42 = call i64 @"sx_f64_sub"(i64 %t40, i64 %t41)
  %t43 = call i64 @"abs_f64"(i64 %t42)
  %t44 = call i64 @"sx_f64_add"(i64 %t39, i64 %t43)
  store i64 %t44, ptr %local.early_d.11
  %t45 = load i64, ptr %local.count_e.14
  %t46 = add i64 %t45, 1
  store i64 %t46, ptr %local.count_e.14
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t47 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t48 = load i64, ptr %local.step.10
  %t49 = icmp sgt i64 %t48, 2000
  %t50 = zext i1 %t49 to i64
  %t51 = icmp ne i64 %t50, 0
  br i1 %t51, label %then4, label %else4
then4:
  %t52 = load i64, ptr %local.late_d.12
  %t53 = load i64, ptr %local.x.9
  %t54 = load i64, ptr %local.prev_x.13
  %t55 = call i64 @"sx_f64_sub"(i64 %t53, i64 %t54)
  %t56 = call i64 @"abs_f64"(i64 %t55)
  %t57 = call i64 @"sx_f64_add"(i64 %t52, i64 %t56)
  store i64 %t57, ptr %local.late_d.12
  %t58 = load i64, ptr %local.count_l.15
  %t59 = add i64 %t58, 1
  store i64 %t59, ptr %local.count_l.15
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t60 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t61 = phi i64 [ %t60, %then2_end ], [ 0, %else2_end ]
  %t62 = load i64, ptr %local.x.9
  store i64 %t62, ptr %local.prev_x.13
  %t63 = load i64, ptr %local.step.10
  %t64 = add i64 %t63, 1
  store i64 %t64, ptr %local.step.10
  br label %loop1
endloop1:
  %t65 = load i64, ptr %local.count_e.14
  %t66 = icmp sgt i64 %t65, 0
  %t67 = zext i1 %t66 to i64
  %t68 = icmp ne i64 %t67, 0
  br i1 %t68, label %then5, label %else5
then5:
  %t69 = load i64, ptr %local.early_d.11
  %t70 = load i64, ptr %local.count_e.14
  %t71 = call i64 @"sx_int_to_f64"(i64 %t70)
  %t72 = call i64 @"sx_f64_div"(i64 %t69, i64 %t71)
  store i64 %t72, ptr %local.early_d.11
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t73 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t74 = load i64, ptr %local.count_l.15
  %t75 = icmp sgt i64 %t74, 0
  %t76 = zext i1 %t75 to i64
  %t77 = icmp ne i64 %t76, 0
  br i1 %t77, label %then6, label %else6
then6:
  %t78 = load i64, ptr %local.late_d.12
  %t79 = load i64, ptr %local.count_l.15
  %t80 = call i64 @"sx_int_to_f64"(i64 %t79)
  %t81 = call i64 @"sx_f64_div"(i64 %t78, i64 %t80)
  store i64 %t81, ptr %local.late_d.12
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t82 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t83 = load i64, ptr %local.early_d.11
  %t84 = call i64 @f64_parse(ptr @.str.exp_s_entropy.7)
  %t85 = call i64 @"sx_f64_gt"(i64 %t83, i64 %t84)
  %t86 = icmp ne i64 %t85, 0
  br i1 %t86, label %then7, label %else7
then7:
  %t87 = call i64 @f64_parse(ptr @.str.exp_s_entropy.8)
  %t88 = load i64, ptr %local.late_d.12
  %t89 = load i64, ptr %local.early_d.11
  %t90 = call i64 @"sx_f64_div"(i64 %t88, i64 %t89)
  %t91 = call i64 @"sx_f64_sub"(i64 %t87, i64 %t90)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t92 = load i64, ptr %local.late_d.12
  %t93 = call i64 @f64_parse(ptr @.str.exp_s_entropy.9)
  %t94 = call i64 @"sx_f64_lt"(i64 %t92, i64 %t93)
  %t95 = icmp ne i64 %t94, 0
  br i1 %t95, label %then8, label %else8
then8:
  %t96 = call i64 @f64_parse(ptr @.str.exp_s_entropy.10)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t97 = call i64 @f64_parse(ptr @.str.exp_s_entropy.11)
  %t98 = call i64 @f64_parse(ptr @.str.exp_s_entropy.12)
  %t99 = call i64 @"sx_f64_sub"(i64 %t97, i64 %t98)
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t100 = phi i64 [ %t96, %then8_end ], [ %t99, %else8_end ]
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t101 = phi i64 [ %t91, %then7_end ], [ %t100, %else7_end ]
  ret i64 %t101
}

define i64 @"shannon_entropy"(i64 %r) nounwind {
entry:
  %local.x.102 = alloca i64
  %local.step.103 = alloca i64
  %local.b0.104 = alloca i64
  %local.b1.105 = alloca i64
  %local.b2.106 = alloca i64
  %local.b3.107 = alloca i64
  %local.b4.108 = alloca i64
  %local.b5.109 = alloca i64
  %local.b6.110 = alloca i64
  %local.b7.111 = alloca i64
  %local.b8.112 = alloca i64
  %local.b9.113 = alloca i64
  %local.samples.114 = alloca i64
  %local.bin.115 = alloca i64
  %local.h.116 = alloca i64
  %local.p.117 = alloca i64
  %local.total.118 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t119 = call i64 @f64_parse(ptr @.str.exp_s_entropy.13)
  store i64 %t119, ptr %local.x.102
  store i64 0, ptr %local.step.103
  store i64 0, ptr %local.b0.104
  store i64 0, ptr %local.b1.105
  store i64 0, ptr %local.b2.106
  store i64 0, ptr %local.b3.107
  store i64 0, ptr %local.b4.108
  store i64 0, ptr %local.b5.109
  store i64 0, ptr %local.b6.110
  store i64 0, ptr %local.b7.111
  store i64 0, ptr %local.b8.112
  store i64 0, ptr %local.b9.113
  br label %loop9
loop9:
  %t120 = load i64, ptr %local.step.103
  %t121 = icmp slt i64 %t120, 500
  %t122 = zext i1 %t121 to i64
  %t123 = icmp ne i64 %t122, 0
  br i1 %t123, label %body9, label %endloop9
body9:
  %t124 = load i64, ptr %local.r
  %t125 = load i64, ptr %local.x.102
  %t126 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t125)
  %t127 = call i64 @f64_parse(ptr @.str.exp_s_entropy.14)
  %t128 = load i64, ptr %local.x.102
  %t129 = call i64 @"sx_f64_sub"(i64 %t127, i64 %t128)
  %t130 = call i64 @"sx_f64_mul"(i64 %t126, i64 %t129)
  store i64 %t130, ptr %local.x.102
  %t131 = load i64, ptr %local.step.103
  %t132 = add i64 %t131, 1
  store i64 %t132, ptr %local.step.103
  br label %loop9
endloop9:
  store i64 0, ptr %local.samples.114
  br label %loop10
loop10:
  %t133 = load i64, ptr %local.samples.114
  %t134 = icmp slt i64 %t133, 500
  %t135 = zext i1 %t134 to i64
  %t136 = icmp ne i64 %t135, 0
  br i1 %t136, label %body10, label %endloop10
body10:
  %t137 = load i64, ptr %local.r
  %t138 = load i64, ptr %local.x.102
  %t139 = call i64 @"sx_f64_mul"(i64 %t137, i64 %t138)
  %t140 = call i64 @f64_parse(ptr @.str.exp_s_entropy.15)
  %t141 = load i64, ptr %local.x.102
  %t142 = call i64 @"sx_f64_sub"(i64 %t140, i64 %t141)
  %t143 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t142)
  store i64 %t143, ptr %local.x.102
  %t144 = load i64, ptr %local.x.102
  %t145 = call i64 @f64_parse(ptr @.str.exp_s_entropy.16)
  %t146 = call i64 @"sx_f64_mul"(i64 %t144, i64 %t145)
  %t147 = call i64 @"sx_f64_to_int"(i64 %t146)
  store i64 %t147, ptr %local.bin.115
  %t148 = load i64, ptr %local.bin.115
  %t149 = icmp eq i64 %t148, 0
  %t150 = zext i1 %t149 to i64
  %t151 = icmp ne i64 %t150, 0
  br i1 %t151, label %then11, label %else11
then11:
  %t152 = load i64, ptr %local.b0.104
  %t153 = add i64 %t152, 1
  store i64 %t153, ptr %local.b0.104
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t154 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t155 = load i64, ptr %local.bin.115
  %t156 = icmp eq i64 %t155, 1
  %t157 = zext i1 %t156 to i64
  %t158 = icmp ne i64 %t157, 0
  br i1 %t158, label %then12, label %else12
then12:
  %t159 = load i64, ptr %local.b1.105
  %t160 = add i64 %t159, 1
  store i64 %t160, ptr %local.b1.105
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t161 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t162 = load i64, ptr %local.bin.115
  %t163 = icmp eq i64 %t162, 2
  %t164 = zext i1 %t163 to i64
  %t165 = icmp ne i64 %t164, 0
  br i1 %t165, label %then13, label %else13
then13:
  %t166 = load i64, ptr %local.b2.106
  %t167 = add i64 %t166, 1
  store i64 %t167, ptr %local.b2.106
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t168 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t169 = load i64, ptr %local.bin.115
  %t170 = icmp eq i64 %t169, 3
  %t171 = zext i1 %t170 to i64
  %t172 = icmp ne i64 %t171, 0
  br i1 %t172, label %then14, label %else14
then14:
  %t173 = load i64, ptr %local.b3.107
  %t174 = add i64 %t173, 1
  store i64 %t174, ptr %local.b3.107
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t175 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t176 = load i64, ptr %local.bin.115
  %t177 = icmp eq i64 %t176, 4
  %t178 = zext i1 %t177 to i64
  %t179 = icmp ne i64 %t178, 0
  br i1 %t179, label %then15, label %else15
then15:
  %t180 = load i64, ptr %local.b4.108
  %t181 = add i64 %t180, 1
  store i64 %t181, ptr %local.b4.108
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t182 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t183 = load i64, ptr %local.bin.115
  %t184 = icmp eq i64 %t183, 5
  %t185 = zext i1 %t184 to i64
  %t186 = icmp ne i64 %t185, 0
  br i1 %t186, label %then16, label %else16
then16:
  %t187 = load i64, ptr %local.b5.109
  %t188 = add i64 %t187, 1
  store i64 %t188, ptr %local.b5.109
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t189 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t190 = load i64, ptr %local.bin.115
  %t191 = icmp eq i64 %t190, 6
  %t192 = zext i1 %t191 to i64
  %t193 = icmp ne i64 %t192, 0
  br i1 %t193, label %then17, label %else17
then17:
  %t194 = load i64, ptr %local.b6.110
  %t195 = add i64 %t194, 1
  store i64 %t195, ptr %local.b6.110
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t196 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t197 = load i64, ptr %local.bin.115
  %t198 = icmp eq i64 %t197, 7
  %t199 = zext i1 %t198 to i64
  %t200 = icmp ne i64 %t199, 0
  br i1 %t200, label %then18, label %else18
then18:
  %t201 = load i64, ptr %local.b7.111
  %t202 = add i64 %t201, 1
  store i64 %t202, ptr %local.b7.111
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t203 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t204 = load i64, ptr %local.bin.115
  %t205 = icmp eq i64 %t204, 8
  %t206 = zext i1 %t205 to i64
  %t207 = icmp ne i64 %t206, 0
  br i1 %t207, label %then19, label %else19
then19:
  %t208 = load i64, ptr %local.b8.112
  %t209 = add i64 %t208, 1
  store i64 %t209, ptr %local.b8.112
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t210 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t211 = load i64, ptr %local.bin.115
  %t212 = icmp sge i64 %t211, 9
  %t213 = zext i1 %t212 to i64
  %t214 = icmp ne i64 %t213, 0
  br i1 %t214, label %then20, label %else20
then20:
  %t215 = load i64, ptr %local.b9.113
  %t216 = add i64 %t215, 1
  store i64 %t216, ptr %local.b9.113
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t217 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t218 = load i64, ptr %local.samples.114
  %t219 = add i64 %t218, 1
  store i64 %t219, ptr %local.samples.114
  br label %loop10
endloop10:
  %t220 = call i64 @f64_parse(ptr @.str.exp_s_entropy.17)
  store i64 %t220, ptr %local.h.116
  %t221 = call i64 @f64_parse(ptr @.str.exp_s_entropy.18)
  store i64 %t221, ptr %local.p.117
  %t222 = call i64 @f64_parse(ptr @.str.exp_s_entropy.19)
  store i64 %t222, ptr %local.total.118
  %t223 = load i64, ptr %local.b0.104
  %t224 = icmp sgt i64 %t223, 0
  %t225 = zext i1 %t224 to i64
  %t226 = icmp ne i64 %t225, 0
  br i1 %t226, label %then21, label %else21
then21:
  %t227 = load i64, ptr %local.b0.104
  %t228 = call i64 @"sx_int_to_f64"(i64 %t227)
  %t229 = load i64, ptr %local.total.118
  %t230 = call i64 @"sx_f64_div"(i64 %t228, i64 %t229)
  store i64 %t230, ptr %local.p.117
  %t231 = load i64, ptr %local.h.116
  %t232 = load i64, ptr %local.p.117
  %t233 = load i64, ptr %local.p.117
  %t234 = call i64 @"ln_f64"(i64 %t233)
  %t235 = call i64 @"sx_f64_mul"(i64 %t232, i64 %t234)
  %t236 = call i64 @"sx_f64_sub"(i64 %t231, i64 %t235)
  store i64 %t236, ptr %local.h.116
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t237 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t238 = load i64, ptr %local.b1.105
  %t239 = icmp sgt i64 %t238, 0
  %t240 = zext i1 %t239 to i64
  %t241 = icmp ne i64 %t240, 0
  br i1 %t241, label %then22, label %else22
then22:
  %t242 = load i64, ptr %local.b1.105
  %t243 = call i64 @"sx_int_to_f64"(i64 %t242)
  %t244 = load i64, ptr %local.total.118
  %t245 = call i64 @"sx_f64_div"(i64 %t243, i64 %t244)
  store i64 %t245, ptr %local.p.117
  %t246 = load i64, ptr %local.h.116
  %t247 = load i64, ptr %local.p.117
  %t248 = load i64, ptr %local.p.117
  %t249 = call i64 @"ln_f64"(i64 %t248)
  %t250 = call i64 @"sx_f64_mul"(i64 %t247, i64 %t249)
  %t251 = call i64 @"sx_f64_sub"(i64 %t246, i64 %t250)
  store i64 %t251, ptr %local.h.116
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t252 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t253 = load i64, ptr %local.b2.106
  %t254 = icmp sgt i64 %t253, 0
  %t255 = zext i1 %t254 to i64
  %t256 = icmp ne i64 %t255, 0
  br i1 %t256, label %then23, label %else23
then23:
  %t257 = load i64, ptr %local.b2.106
  %t258 = call i64 @"sx_int_to_f64"(i64 %t257)
  %t259 = load i64, ptr %local.total.118
  %t260 = call i64 @"sx_f64_div"(i64 %t258, i64 %t259)
  store i64 %t260, ptr %local.p.117
  %t261 = load i64, ptr %local.h.116
  %t262 = load i64, ptr %local.p.117
  %t263 = load i64, ptr %local.p.117
  %t264 = call i64 @"ln_f64"(i64 %t263)
  %t265 = call i64 @"sx_f64_mul"(i64 %t262, i64 %t264)
  %t266 = call i64 @"sx_f64_sub"(i64 %t261, i64 %t265)
  store i64 %t266, ptr %local.h.116
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t267 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t268 = load i64, ptr %local.b3.107
  %t269 = icmp sgt i64 %t268, 0
  %t270 = zext i1 %t269 to i64
  %t271 = icmp ne i64 %t270, 0
  br i1 %t271, label %then24, label %else24
then24:
  %t272 = load i64, ptr %local.b3.107
  %t273 = call i64 @"sx_int_to_f64"(i64 %t272)
  %t274 = load i64, ptr %local.total.118
  %t275 = call i64 @"sx_f64_div"(i64 %t273, i64 %t274)
  store i64 %t275, ptr %local.p.117
  %t276 = load i64, ptr %local.h.116
  %t277 = load i64, ptr %local.p.117
  %t278 = load i64, ptr %local.p.117
  %t279 = call i64 @"ln_f64"(i64 %t278)
  %t280 = call i64 @"sx_f64_mul"(i64 %t277, i64 %t279)
  %t281 = call i64 @"sx_f64_sub"(i64 %t276, i64 %t280)
  store i64 %t281, ptr %local.h.116
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t282 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t283 = load i64, ptr %local.b4.108
  %t284 = icmp sgt i64 %t283, 0
  %t285 = zext i1 %t284 to i64
  %t286 = icmp ne i64 %t285, 0
  br i1 %t286, label %then25, label %else25
then25:
  %t287 = load i64, ptr %local.b4.108
  %t288 = call i64 @"sx_int_to_f64"(i64 %t287)
  %t289 = load i64, ptr %local.total.118
  %t290 = call i64 @"sx_f64_div"(i64 %t288, i64 %t289)
  store i64 %t290, ptr %local.p.117
  %t291 = load i64, ptr %local.h.116
  %t292 = load i64, ptr %local.p.117
  %t293 = load i64, ptr %local.p.117
  %t294 = call i64 @"ln_f64"(i64 %t293)
  %t295 = call i64 @"sx_f64_mul"(i64 %t292, i64 %t294)
  %t296 = call i64 @"sx_f64_sub"(i64 %t291, i64 %t295)
  store i64 %t296, ptr %local.h.116
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t297 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t298 = load i64, ptr %local.b5.109
  %t299 = icmp sgt i64 %t298, 0
  %t300 = zext i1 %t299 to i64
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %then26, label %else26
then26:
  %t302 = load i64, ptr %local.b5.109
  %t303 = call i64 @"sx_int_to_f64"(i64 %t302)
  %t304 = load i64, ptr %local.total.118
  %t305 = call i64 @"sx_f64_div"(i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.p.117
  %t306 = load i64, ptr %local.h.116
  %t307 = load i64, ptr %local.p.117
  %t308 = load i64, ptr %local.p.117
  %t309 = call i64 @"ln_f64"(i64 %t308)
  %t310 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t309)
  %t311 = call i64 @"sx_f64_sub"(i64 %t306, i64 %t310)
  store i64 %t311, ptr %local.h.116
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t312 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t313 = load i64, ptr %local.b6.110
  %t314 = icmp sgt i64 %t313, 0
  %t315 = zext i1 %t314 to i64
  %t316 = icmp ne i64 %t315, 0
  br i1 %t316, label %then27, label %else27
then27:
  %t317 = load i64, ptr %local.b6.110
  %t318 = call i64 @"sx_int_to_f64"(i64 %t317)
  %t319 = load i64, ptr %local.total.118
  %t320 = call i64 @"sx_f64_div"(i64 %t318, i64 %t319)
  store i64 %t320, ptr %local.p.117
  %t321 = load i64, ptr %local.h.116
  %t322 = load i64, ptr %local.p.117
  %t323 = load i64, ptr %local.p.117
  %t324 = call i64 @"ln_f64"(i64 %t323)
  %t325 = call i64 @"sx_f64_mul"(i64 %t322, i64 %t324)
  %t326 = call i64 @"sx_f64_sub"(i64 %t321, i64 %t325)
  store i64 %t326, ptr %local.h.116
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t327 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t328 = load i64, ptr %local.b7.111
  %t329 = icmp sgt i64 %t328, 0
  %t330 = zext i1 %t329 to i64
  %t331 = icmp ne i64 %t330, 0
  br i1 %t331, label %then28, label %else28
then28:
  %t332 = load i64, ptr %local.b7.111
  %t333 = call i64 @"sx_int_to_f64"(i64 %t332)
  %t334 = load i64, ptr %local.total.118
  %t335 = call i64 @"sx_f64_div"(i64 %t333, i64 %t334)
  store i64 %t335, ptr %local.p.117
  %t336 = load i64, ptr %local.h.116
  %t337 = load i64, ptr %local.p.117
  %t338 = load i64, ptr %local.p.117
  %t339 = call i64 @"ln_f64"(i64 %t338)
  %t340 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t339)
  %t341 = call i64 @"sx_f64_sub"(i64 %t336, i64 %t340)
  store i64 %t341, ptr %local.h.116
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t342 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t343 = load i64, ptr %local.b8.112
  %t344 = icmp sgt i64 %t343, 0
  %t345 = zext i1 %t344 to i64
  %t346 = icmp ne i64 %t345, 0
  br i1 %t346, label %then29, label %else29
then29:
  %t347 = load i64, ptr %local.b8.112
  %t348 = call i64 @"sx_int_to_f64"(i64 %t347)
  %t349 = load i64, ptr %local.total.118
  %t350 = call i64 @"sx_f64_div"(i64 %t348, i64 %t349)
  store i64 %t350, ptr %local.p.117
  %t351 = load i64, ptr %local.h.116
  %t352 = load i64, ptr %local.p.117
  %t353 = load i64, ptr %local.p.117
  %t354 = call i64 @"ln_f64"(i64 %t353)
  %t355 = call i64 @"sx_f64_mul"(i64 %t352, i64 %t354)
  %t356 = call i64 @"sx_f64_sub"(i64 %t351, i64 %t355)
  store i64 %t356, ptr %local.h.116
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t357 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t358 = load i64, ptr %local.b9.113
  %t359 = icmp sgt i64 %t358, 0
  %t360 = zext i1 %t359 to i64
  %t361 = icmp ne i64 %t360, 0
  br i1 %t361, label %then30, label %else30
then30:
  %t362 = load i64, ptr %local.b9.113
  %t363 = call i64 @"sx_int_to_f64"(i64 %t362)
  %t364 = load i64, ptr %local.total.118
  %t365 = call i64 @"sx_f64_div"(i64 %t363, i64 %t364)
  store i64 %t365, ptr %local.p.117
  %t366 = load i64, ptr %local.h.116
  %t367 = load i64, ptr %local.p.117
  %t368 = load i64, ptr %local.p.117
  %t369 = call i64 @"ln_f64"(i64 %t368)
  %t370 = call i64 @"sx_f64_mul"(i64 %t367, i64 %t369)
  %t371 = call i64 @"sx_f64_sub"(i64 %t366, i64 %t370)
  store i64 %t371, ptr %local.h.116
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t372 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t373 = load i64, ptr %local.h.116
  ret i64 %t373
}

define i64 @"test_s_vs_shannon"() nounwind {
entry:
  %local.r.374 = alloca i64
  %local.sum_sh.375 = alloca i64
  %local.sum_ss.376 = alloca i64
  %local.sum_sh2.377 = alloca i64
  %local.sum_ss2.378 = alloca i64
  %local.sum_shs.379 = alloca i64
  %local.n.380 = alloca i64
  %local.s.381 = alloca i64
  %local.h.382 = alloca i64
  %local.nf.383 = alloca i64
  %local.num.384 = alloca i64
  %local.den_a.385 = alloca i64
  %local.den_b.386 = alloca i64
  %local.corr.387 = alloca i64
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.20)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_println(ptr %t390)
  %t391 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.21)
  %t392 = ptrtoint ptr %t391 to i64
  %t393 = inttoptr i64 %t392 to ptr
  call void @intrinsic_println(ptr %t393)
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.22)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_println(ptr %t396)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.23)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.24)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_println(ptr %t402)
  %t403 = call i64 @f64_parse(ptr @.str.exp_s_entropy.25)
  store i64 %t403, ptr %local.r.374
  %t404 = call i64 @f64_parse(ptr @.str.exp_s_entropy.26)
  store i64 %t404, ptr %local.sum_sh.375
  %t405 = call i64 @f64_parse(ptr @.str.exp_s_entropy.27)
  store i64 %t405, ptr %local.sum_ss.376
  %t406 = call i64 @f64_parse(ptr @.str.exp_s_entropy.28)
  store i64 %t406, ptr %local.sum_sh2.377
  %t407 = call i64 @f64_parse(ptr @.str.exp_s_entropy.29)
  store i64 %t407, ptr %local.sum_ss2.378
  %t408 = call i64 @f64_parse(ptr @.str.exp_s_entropy.30)
  store i64 %t408, ptr %local.sum_shs.379
  store i64 0, ptr %local.n.380
  br label %loop31
loop31:
  %t409 = load i64, ptr %local.r.374
  %t410 = call i64 @f64_parse(ptr @.str.exp_s_entropy.31)
  %t411 = call i64 @"sx_f64_lt"(i64 %t409, i64 %t410)
  %t412 = icmp ne i64 %t411, 0
  br i1 %t412, label %body31, label %endloop31
body31:
  %t413 = load i64, ptr %local.r.374
  %t414 = call i64 @"logistic_S"(i64 %t413)
  store i64 %t414, ptr %local.s.381
  %t415 = load i64, ptr %local.r.374
  %t416 = call i64 @"shannon_entropy"(i64 %t415)
  store i64 %t416, ptr %local.h.382
  %t417 = load i64, ptr %local.sum_sh.375
  %t418 = load i64, ptr %local.h.382
  %t419 = call i64 @"sx_f64_add"(i64 %t417, i64 %t418)
  store i64 %t419, ptr %local.sum_sh.375
  %t420 = load i64, ptr %local.sum_ss.376
  %t421 = load i64, ptr %local.s.381
  %t422 = call i64 @"sx_f64_add"(i64 %t420, i64 %t421)
  store i64 %t422, ptr %local.sum_ss.376
  %t423 = load i64, ptr %local.sum_sh2.377
  %t424 = load i64, ptr %local.h.382
  %t425 = load i64, ptr %local.h.382
  %t426 = call i64 @"sx_f64_mul"(i64 %t424, i64 %t425)
  %t427 = call i64 @"sx_f64_add"(i64 %t423, i64 %t426)
  store i64 %t427, ptr %local.sum_sh2.377
  %t428 = load i64, ptr %local.sum_ss2.378
  %t429 = load i64, ptr %local.s.381
  %t430 = load i64, ptr %local.s.381
  %t431 = call i64 @"sx_f64_mul"(i64 %t429, i64 %t430)
  %t432 = call i64 @"sx_f64_add"(i64 %t428, i64 %t431)
  store i64 %t432, ptr %local.sum_ss2.378
  %t433 = load i64, ptr %local.sum_shs.379
  %t434 = load i64, ptr %local.s.381
  %t435 = load i64, ptr %local.h.382
  %t436 = call i64 @"sx_f64_mul"(i64 %t434, i64 %t435)
  %t437 = call i64 @"sx_f64_add"(i64 %t433, i64 %t436)
  store i64 %t437, ptr %local.sum_shs.379
  %t438 = load i64, ptr %local.n.380
  %t439 = add i64 %t438, 1
  store i64 %t439, ptr %local.n.380
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.32)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_print(ptr %t442)
  %t443 = load i64, ptr %local.r.374
  %t444 = call i64 @"print_f64"(i64 %t443)
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.33)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_print(ptr %t447)
  %t448 = load i64, ptr %local.s.381
  %t449 = call i64 @"print_f64"(i64 %t448)
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.34)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_print(ptr %t452)
  %t453 = load i64, ptr %local.h.382
  %t454 = call i64 @"print_f64"(i64 %t453)
  %t455 = load i64, ptr %local.s.381
  %t456 = call i64 @f64_parse(ptr @.str.exp_s_entropy.35)
  %t457 = call i64 @"sx_f64_gt"(i64 %t455, i64 %t456)
  %t458 = icmp ne i64 %t457, 0
  br i1 %t458, label %then32, label %else32
then32:
  %t459 = load i64, ptr %local.h.382
  %t460 = call i64 @f64_parse(ptr @.str.exp_s_entropy.36)
  %t461 = call i64 @"sx_f64_lt"(i64 %t459, i64 %t460)
  %t462 = icmp ne i64 %t461, 0
  br i1 %t462, label %then33, label %else33
then33:
  %t463 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.37)
  %t464 = ptrtoint ptr %t463 to i64
  %t465 = inttoptr i64 %t464 to ptr
  call void @intrinsic_println(ptr %t465)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t466 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.38)
  %t467 = ptrtoint ptr %t466 to i64
  %t468 = inttoptr i64 %t467 to ptr
  call void @intrinsic_println(ptr %t468)
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t469 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t470 = load i64, ptr %local.h.382
  %t471 = call i64 @f64_parse(ptr @.str.exp_s_entropy.39)
  %t472 = call i64 @"sx_f64_gt"(i64 %t470, i64 %t471)
  %t473 = icmp ne i64 %t472, 0
  br i1 %t473, label %then34, label %else34
then34:
  %t474 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.40)
  %t475 = ptrtoint ptr %t474 to i64
  %t476 = inttoptr i64 %t475 to ptr
  call void @intrinsic_println(ptr %t476)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  %t477 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.41)
  %t478 = ptrtoint ptr %t477 to i64
  %t479 = inttoptr i64 %t478 to ptr
  call void @intrinsic_println(ptr %t479)
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t480 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t481 = phi i64 [ %t469, %then32_end ], [ %t480, %else32_end ]
  %t482 = load i64, ptr %local.r.374
  %t483 = call i64 @f64_parse(ptr @.str.exp_s_entropy.42)
  %t484 = call i64 @"sx_f64_add"(i64 %t482, i64 %t483)
  store i64 %t484, ptr %local.r.374
  br label %loop31
endloop31:
  %t485 = load i64, ptr %local.n.380
  %t486 = call i64 @"sx_int_to_f64"(i64 %t485)
  store i64 %t486, ptr %local.nf.383
  %t487 = load i64, ptr %local.nf.383
  %t488 = load i64, ptr %local.sum_shs.379
  %t489 = call i64 @"sx_f64_mul"(i64 %t487, i64 %t488)
  %t490 = load i64, ptr %local.sum_ss.376
  %t491 = load i64, ptr %local.sum_sh.375
  %t492 = call i64 @"sx_f64_mul"(i64 %t490, i64 %t491)
  %t493 = call i64 @"sx_f64_sub"(i64 %t489, i64 %t492)
  store i64 %t493, ptr %local.num.384
  %t494 = load i64, ptr %local.nf.383
  %t495 = load i64, ptr %local.sum_ss2.378
  %t496 = call i64 @"sx_f64_mul"(i64 %t494, i64 %t495)
  %t497 = load i64, ptr %local.sum_ss.376
  %t498 = load i64, ptr %local.sum_ss.376
  %t499 = call i64 @"sx_f64_mul"(i64 %t497, i64 %t498)
  %t500 = call i64 @"sx_f64_sub"(i64 %t496, i64 %t499)
  store i64 %t500, ptr %local.den_a.385
  %t501 = load i64, ptr %local.nf.383
  %t502 = load i64, ptr %local.sum_sh2.377
  %t503 = call i64 @"sx_f64_mul"(i64 %t501, i64 %t502)
  %t504 = load i64, ptr %local.sum_sh.375
  %t505 = load i64, ptr %local.sum_sh.375
  %t506 = call i64 @"sx_f64_mul"(i64 %t504, i64 %t505)
  %t507 = call i64 @"sx_f64_sub"(i64 %t503, i64 %t506)
  store i64 %t507, ptr %local.den_b.386
  %t508 = call i64 @f64_parse(ptr @.str.exp_s_entropy.43)
  store i64 %t508, ptr %local.corr.387
  %t509 = load i64, ptr %local.den_a.385
  %t510 = call i64 @f64_parse(ptr @.str.exp_s_entropy.44)
  %t511 = call i64 @"sx_f64_gt"(i64 %t509, i64 %t510)
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then35, label %else35
then35:
  %t513 = load i64, ptr %local.den_b.386
  %t514 = call i64 @f64_parse(ptr @.str.exp_s_entropy.45)
  %t515 = call i64 @"sx_f64_gt"(i64 %t513, i64 %t514)
  %t516 = icmp ne i64 %t515, 0
  br i1 %t516, label %then36, label %else36
then36:
  %t517 = load i64, ptr %local.num.384
  %t518 = load i64, ptr %local.den_a.385
  %t519 = load i64, ptr %local.den_b.386
  %t520 = call i64 @"sx_f64_mul"(i64 %t518, i64 %t519)
  %t521 = call i64 @"sqrt_f64"(i64 %t520)
  %t522 = call i64 @"sx_f64_div"(i64 %t517, i64 %t521)
  store i64 %t522, ptr %local.corr.387
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t523 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t524 = phi i64 [ %t523, %then35_end ], [ 0, %else35_end ]
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.46)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  %t528 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.47)
  %t529 = ptrtoint ptr %t528 to i64
  %t530 = inttoptr i64 %t529 to ptr
  call void @intrinsic_print(ptr %t530)
  %t531 = load i64, ptr %local.corr.387
  %t532 = call i64 @"print_f64"(i64 %t531)
  %t533 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.48)
  %t534 = ptrtoint ptr %t533 to i64
  %t535 = inttoptr i64 %t534 to ptr
  call void @intrinsic_println(ptr %t535)
  %t536 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.49)
  %t537 = ptrtoint ptr %t536 to i64
  %t538 = inttoptr i64 %t537 to ptr
  call void @intrinsic_println(ptr %t538)
  %t539 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.50)
  %t540 = ptrtoint ptr %t539 to i64
  %t541 = inttoptr i64 %t540 to ptr
  call void @intrinsic_println(ptr %t541)
  ret i64 0
}

define i64 @"window_entropy"(i64 %r, i64 %skip, i64 %count) nounwind {
entry:
  %local.x.542 = alloca i64
  %local.step.543 = alloca i64
  %local.b0.544 = alloca i64
  %local.b1.545 = alloca i64
  %local.b2.546 = alloca i64
  %local.b3.547 = alloca i64
  %local.b4.548 = alloca i64
  %local.b5.549 = alloca i64
  %local.b6.550 = alloca i64
  %local.b7.551 = alloca i64
  %local.b8.552 = alloca i64
  %local.b9.553 = alloca i64
  %local.s.554 = alloca i64
  %local.bin.555 = alloca i64
  %local.h.556 = alloca i64
  %local.p.557 = alloca i64
  %local.total.558 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.skip = alloca i64
  store i64 %skip, ptr %local.skip
  %local.count = alloca i64
  store i64 %count, ptr %local.count
  %t559 = call i64 @f64_parse(ptr @.str.exp_s_entropy.51)
  store i64 %t559, ptr %local.x.542
  store i64 0, ptr %local.step.543
  store i64 0, ptr %local.b0.544
  store i64 0, ptr %local.b1.545
  store i64 0, ptr %local.b2.546
  store i64 0, ptr %local.b3.547
  store i64 0, ptr %local.b4.548
  store i64 0, ptr %local.b5.549
  store i64 0, ptr %local.b6.550
  store i64 0, ptr %local.b7.551
  store i64 0, ptr %local.b8.552
  store i64 0, ptr %local.b9.553
  br label %loop37
loop37:
  %t560 = load i64, ptr %local.step.543
  %t561 = load i64, ptr %local.skip
  %t562 = icmp slt i64 %t560, %t561
  %t563 = zext i1 %t562 to i64
  %t564 = icmp ne i64 %t563, 0
  br i1 %t564, label %body37, label %endloop37
body37:
  %t565 = load i64, ptr %local.r
  %t566 = load i64, ptr %local.x.542
  %t567 = call i64 @"sx_f64_mul"(i64 %t565, i64 %t566)
  %t568 = call i64 @f64_parse(ptr @.str.exp_s_entropy.52)
  %t569 = load i64, ptr %local.x.542
  %t570 = call i64 @"sx_f64_sub"(i64 %t568, i64 %t569)
  %t571 = call i64 @"sx_f64_mul"(i64 %t567, i64 %t570)
  store i64 %t571, ptr %local.x.542
  %t572 = load i64, ptr %local.step.543
  %t573 = add i64 %t572, 1
  store i64 %t573, ptr %local.step.543
  br label %loop37
endloop37:
  store i64 0, ptr %local.s.554
  br label %loop38
loop38:
  %t574 = load i64, ptr %local.s.554
  %t575 = load i64, ptr %local.count
  %t576 = icmp slt i64 %t574, %t575
  %t577 = zext i1 %t576 to i64
  %t578 = icmp ne i64 %t577, 0
  br i1 %t578, label %body38, label %endloop38
body38:
  %t579 = load i64, ptr %local.r
  %t580 = load i64, ptr %local.x.542
  %t581 = call i64 @"sx_f64_mul"(i64 %t579, i64 %t580)
  %t582 = call i64 @f64_parse(ptr @.str.exp_s_entropy.53)
  %t583 = load i64, ptr %local.x.542
  %t584 = call i64 @"sx_f64_sub"(i64 %t582, i64 %t583)
  %t585 = call i64 @"sx_f64_mul"(i64 %t581, i64 %t584)
  store i64 %t585, ptr %local.x.542
  %t586 = load i64, ptr %local.x.542
  %t587 = call i64 @f64_parse(ptr @.str.exp_s_entropy.54)
  %t588 = call i64 @"sx_f64_mul"(i64 %t586, i64 %t587)
  %t589 = call i64 @"sx_f64_to_int"(i64 %t588)
  store i64 %t589, ptr %local.bin.555
  %t590 = load i64, ptr %local.bin.555
  %t591 = icmp eq i64 %t590, 0
  %t592 = zext i1 %t591 to i64
  %t593 = icmp ne i64 %t592, 0
  br i1 %t593, label %then39, label %else39
then39:
  %t594 = load i64, ptr %local.b0.544
  %t595 = add i64 %t594, 1
  store i64 %t595, ptr %local.b0.544
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t596 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t597 = load i64, ptr %local.bin.555
  %t598 = icmp eq i64 %t597, 1
  %t599 = zext i1 %t598 to i64
  %t600 = icmp ne i64 %t599, 0
  br i1 %t600, label %then40, label %else40
then40:
  %t601 = load i64, ptr %local.b1.545
  %t602 = add i64 %t601, 1
  store i64 %t602, ptr %local.b1.545
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t603 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t604 = load i64, ptr %local.bin.555
  %t605 = icmp eq i64 %t604, 2
  %t606 = zext i1 %t605 to i64
  %t607 = icmp ne i64 %t606, 0
  br i1 %t607, label %then41, label %else41
then41:
  %t608 = load i64, ptr %local.b2.546
  %t609 = add i64 %t608, 1
  store i64 %t609, ptr %local.b2.546
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t610 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t611 = load i64, ptr %local.bin.555
  %t612 = icmp eq i64 %t611, 3
  %t613 = zext i1 %t612 to i64
  %t614 = icmp ne i64 %t613, 0
  br i1 %t614, label %then42, label %else42
then42:
  %t615 = load i64, ptr %local.b3.547
  %t616 = add i64 %t615, 1
  store i64 %t616, ptr %local.b3.547
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t617 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t618 = load i64, ptr %local.bin.555
  %t619 = icmp eq i64 %t618, 4
  %t620 = zext i1 %t619 to i64
  %t621 = icmp ne i64 %t620, 0
  br i1 %t621, label %then43, label %else43
then43:
  %t622 = load i64, ptr %local.b4.548
  %t623 = add i64 %t622, 1
  store i64 %t623, ptr %local.b4.548
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t624 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t625 = load i64, ptr %local.bin.555
  %t626 = icmp eq i64 %t625, 5
  %t627 = zext i1 %t626 to i64
  %t628 = icmp ne i64 %t627, 0
  br i1 %t628, label %then44, label %else44
then44:
  %t629 = load i64, ptr %local.b5.549
  %t630 = add i64 %t629, 1
  store i64 %t630, ptr %local.b5.549
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t631 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t632 = load i64, ptr %local.bin.555
  %t633 = icmp eq i64 %t632, 6
  %t634 = zext i1 %t633 to i64
  %t635 = icmp ne i64 %t634, 0
  br i1 %t635, label %then45, label %else45
then45:
  %t636 = load i64, ptr %local.b6.550
  %t637 = add i64 %t636, 1
  store i64 %t637, ptr %local.b6.550
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t638 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t639 = load i64, ptr %local.bin.555
  %t640 = icmp eq i64 %t639, 7
  %t641 = zext i1 %t640 to i64
  %t642 = icmp ne i64 %t641, 0
  br i1 %t642, label %then46, label %else46
then46:
  %t643 = load i64, ptr %local.b7.551
  %t644 = add i64 %t643, 1
  store i64 %t644, ptr %local.b7.551
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t645 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t646 = load i64, ptr %local.bin.555
  %t647 = icmp eq i64 %t646, 8
  %t648 = zext i1 %t647 to i64
  %t649 = icmp ne i64 %t648, 0
  br i1 %t649, label %then47, label %else47
then47:
  %t650 = load i64, ptr %local.b8.552
  %t651 = add i64 %t650, 1
  store i64 %t651, ptr %local.b8.552
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t652 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t653 = load i64, ptr %local.bin.555
  %t654 = icmp sge i64 %t653, 9
  %t655 = zext i1 %t654 to i64
  %t656 = icmp ne i64 %t655, 0
  br i1 %t656, label %then48, label %else48
then48:
  %t657 = load i64, ptr %local.b9.553
  %t658 = add i64 %t657, 1
  store i64 %t658, ptr %local.b9.553
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t659 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t660 = load i64, ptr %local.s.554
  %t661 = add i64 %t660, 1
  store i64 %t661, ptr %local.s.554
  br label %loop38
endloop38:
  %t662 = call i64 @f64_parse(ptr @.str.exp_s_entropy.55)
  store i64 %t662, ptr %local.h.556
  %t663 = call i64 @f64_parse(ptr @.str.exp_s_entropy.56)
  store i64 %t663, ptr %local.p.557
  %t664 = load i64, ptr %local.count
  %t665 = call i64 @"sx_int_to_f64"(i64 %t664)
  store i64 %t665, ptr %local.total.558
  %t666 = load i64, ptr %local.b0.544
  %t667 = icmp sgt i64 %t666, 0
  %t668 = zext i1 %t667 to i64
  %t669 = icmp ne i64 %t668, 0
  br i1 %t669, label %then49, label %else49
then49:
  %t670 = load i64, ptr %local.b0.544
  %t671 = call i64 @"sx_int_to_f64"(i64 %t670)
  %t672 = load i64, ptr %local.total.558
  %t673 = call i64 @"sx_f64_div"(i64 %t671, i64 %t672)
  store i64 %t673, ptr %local.p.557
  %t674 = load i64, ptr %local.h.556
  %t675 = load i64, ptr %local.p.557
  %t676 = load i64, ptr %local.p.557
  %t677 = call i64 @"ln_f64"(i64 %t676)
  %t678 = call i64 @"sx_f64_mul"(i64 %t675, i64 %t677)
  %t679 = call i64 @"sx_f64_sub"(i64 %t674, i64 %t678)
  store i64 %t679, ptr %local.h.556
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t680 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t681 = load i64, ptr %local.b1.545
  %t682 = icmp sgt i64 %t681, 0
  %t683 = zext i1 %t682 to i64
  %t684 = icmp ne i64 %t683, 0
  br i1 %t684, label %then50, label %else50
then50:
  %t685 = load i64, ptr %local.b1.545
  %t686 = call i64 @"sx_int_to_f64"(i64 %t685)
  %t687 = load i64, ptr %local.total.558
  %t688 = call i64 @"sx_f64_div"(i64 %t686, i64 %t687)
  store i64 %t688, ptr %local.p.557
  %t689 = load i64, ptr %local.h.556
  %t690 = load i64, ptr %local.p.557
  %t691 = load i64, ptr %local.p.557
  %t692 = call i64 @"ln_f64"(i64 %t691)
  %t693 = call i64 @"sx_f64_mul"(i64 %t690, i64 %t692)
  %t694 = call i64 @"sx_f64_sub"(i64 %t689, i64 %t693)
  store i64 %t694, ptr %local.h.556
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t695 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t696 = load i64, ptr %local.b2.546
  %t697 = icmp sgt i64 %t696, 0
  %t698 = zext i1 %t697 to i64
  %t699 = icmp ne i64 %t698, 0
  br i1 %t699, label %then51, label %else51
then51:
  %t700 = load i64, ptr %local.b2.546
  %t701 = call i64 @"sx_int_to_f64"(i64 %t700)
  %t702 = load i64, ptr %local.total.558
  %t703 = call i64 @"sx_f64_div"(i64 %t701, i64 %t702)
  store i64 %t703, ptr %local.p.557
  %t704 = load i64, ptr %local.h.556
  %t705 = load i64, ptr %local.p.557
  %t706 = load i64, ptr %local.p.557
  %t707 = call i64 @"ln_f64"(i64 %t706)
  %t708 = call i64 @"sx_f64_mul"(i64 %t705, i64 %t707)
  %t709 = call i64 @"sx_f64_sub"(i64 %t704, i64 %t708)
  store i64 %t709, ptr %local.h.556
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t710 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t711 = load i64, ptr %local.b3.547
  %t712 = icmp sgt i64 %t711, 0
  %t713 = zext i1 %t712 to i64
  %t714 = icmp ne i64 %t713, 0
  br i1 %t714, label %then52, label %else52
then52:
  %t715 = load i64, ptr %local.b3.547
  %t716 = call i64 @"sx_int_to_f64"(i64 %t715)
  %t717 = load i64, ptr %local.total.558
  %t718 = call i64 @"sx_f64_div"(i64 %t716, i64 %t717)
  store i64 %t718, ptr %local.p.557
  %t719 = load i64, ptr %local.h.556
  %t720 = load i64, ptr %local.p.557
  %t721 = load i64, ptr %local.p.557
  %t722 = call i64 @"ln_f64"(i64 %t721)
  %t723 = call i64 @"sx_f64_mul"(i64 %t720, i64 %t722)
  %t724 = call i64 @"sx_f64_sub"(i64 %t719, i64 %t723)
  store i64 %t724, ptr %local.h.556
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t725 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t726 = load i64, ptr %local.b4.548
  %t727 = icmp sgt i64 %t726, 0
  %t728 = zext i1 %t727 to i64
  %t729 = icmp ne i64 %t728, 0
  br i1 %t729, label %then53, label %else53
then53:
  %t730 = load i64, ptr %local.b4.548
  %t731 = call i64 @"sx_int_to_f64"(i64 %t730)
  %t732 = load i64, ptr %local.total.558
  %t733 = call i64 @"sx_f64_div"(i64 %t731, i64 %t732)
  store i64 %t733, ptr %local.p.557
  %t734 = load i64, ptr %local.h.556
  %t735 = load i64, ptr %local.p.557
  %t736 = load i64, ptr %local.p.557
  %t737 = call i64 @"ln_f64"(i64 %t736)
  %t738 = call i64 @"sx_f64_mul"(i64 %t735, i64 %t737)
  %t739 = call i64 @"sx_f64_sub"(i64 %t734, i64 %t738)
  store i64 %t739, ptr %local.h.556
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t740 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t741 = load i64, ptr %local.b5.549
  %t742 = icmp sgt i64 %t741, 0
  %t743 = zext i1 %t742 to i64
  %t744 = icmp ne i64 %t743, 0
  br i1 %t744, label %then54, label %else54
then54:
  %t745 = load i64, ptr %local.b5.549
  %t746 = call i64 @"sx_int_to_f64"(i64 %t745)
  %t747 = load i64, ptr %local.total.558
  %t748 = call i64 @"sx_f64_div"(i64 %t746, i64 %t747)
  store i64 %t748, ptr %local.p.557
  %t749 = load i64, ptr %local.h.556
  %t750 = load i64, ptr %local.p.557
  %t751 = load i64, ptr %local.p.557
  %t752 = call i64 @"ln_f64"(i64 %t751)
  %t753 = call i64 @"sx_f64_mul"(i64 %t750, i64 %t752)
  %t754 = call i64 @"sx_f64_sub"(i64 %t749, i64 %t753)
  store i64 %t754, ptr %local.h.556
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t755 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t756 = load i64, ptr %local.b6.550
  %t757 = icmp sgt i64 %t756, 0
  %t758 = zext i1 %t757 to i64
  %t759 = icmp ne i64 %t758, 0
  br i1 %t759, label %then55, label %else55
then55:
  %t760 = load i64, ptr %local.b6.550
  %t761 = call i64 @"sx_int_to_f64"(i64 %t760)
  %t762 = load i64, ptr %local.total.558
  %t763 = call i64 @"sx_f64_div"(i64 %t761, i64 %t762)
  store i64 %t763, ptr %local.p.557
  %t764 = load i64, ptr %local.h.556
  %t765 = load i64, ptr %local.p.557
  %t766 = load i64, ptr %local.p.557
  %t767 = call i64 @"ln_f64"(i64 %t766)
  %t768 = call i64 @"sx_f64_mul"(i64 %t765, i64 %t767)
  %t769 = call i64 @"sx_f64_sub"(i64 %t764, i64 %t768)
  store i64 %t769, ptr %local.h.556
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t770 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t771 = load i64, ptr %local.b7.551
  %t772 = icmp sgt i64 %t771, 0
  %t773 = zext i1 %t772 to i64
  %t774 = icmp ne i64 %t773, 0
  br i1 %t774, label %then56, label %else56
then56:
  %t775 = load i64, ptr %local.b7.551
  %t776 = call i64 @"sx_int_to_f64"(i64 %t775)
  %t777 = load i64, ptr %local.total.558
  %t778 = call i64 @"sx_f64_div"(i64 %t776, i64 %t777)
  store i64 %t778, ptr %local.p.557
  %t779 = load i64, ptr %local.h.556
  %t780 = load i64, ptr %local.p.557
  %t781 = load i64, ptr %local.p.557
  %t782 = call i64 @"ln_f64"(i64 %t781)
  %t783 = call i64 @"sx_f64_mul"(i64 %t780, i64 %t782)
  %t784 = call i64 @"sx_f64_sub"(i64 %t779, i64 %t783)
  store i64 %t784, ptr %local.h.556
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t785 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t786 = load i64, ptr %local.b8.552
  %t787 = icmp sgt i64 %t786, 0
  %t788 = zext i1 %t787 to i64
  %t789 = icmp ne i64 %t788, 0
  br i1 %t789, label %then57, label %else57
then57:
  %t790 = load i64, ptr %local.b8.552
  %t791 = call i64 @"sx_int_to_f64"(i64 %t790)
  %t792 = load i64, ptr %local.total.558
  %t793 = call i64 @"sx_f64_div"(i64 %t791, i64 %t792)
  store i64 %t793, ptr %local.p.557
  %t794 = load i64, ptr %local.h.556
  %t795 = load i64, ptr %local.p.557
  %t796 = load i64, ptr %local.p.557
  %t797 = call i64 @"ln_f64"(i64 %t796)
  %t798 = call i64 @"sx_f64_mul"(i64 %t795, i64 %t797)
  %t799 = call i64 @"sx_f64_sub"(i64 %t794, i64 %t798)
  store i64 %t799, ptr %local.h.556
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t800 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t801 = load i64, ptr %local.b9.553
  %t802 = icmp sgt i64 %t801, 0
  %t803 = zext i1 %t802 to i64
  %t804 = icmp ne i64 %t803, 0
  br i1 %t804, label %then58, label %else58
then58:
  %t805 = load i64, ptr %local.b9.553
  %t806 = call i64 @"sx_int_to_f64"(i64 %t805)
  %t807 = load i64, ptr %local.total.558
  %t808 = call i64 @"sx_f64_div"(i64 %t806, i64 %t807)
  store i64 %t808, ptr %local.p.557
  %t809 = load i64, ptr %local.h.556
  %t810 = load i64, ptr %local.p.557
  %t811 = load i64, ptr %local.p.557
  %t812 = call i64 @"ln_f64"(i64 %t811)
  %t813 = call i64 @"sx_f64_mul"(i64 %t810, i64 %t812)
  %t814 = call i64 @"sx_f64_sub"(i64 %t809, i64 %t813)
  store i64 %t814, ptr %local.h.556
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t815 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t816 = load i64, ptr %local.h.556
  ret i64 %t816
}

define i64 @"test_entropy_rate"() nounwind {
entry:
  %local.r.817 = alloca i64
  %local.agree.818 = alloca i64
  %local.total.819 = alloca i64
  %local.sum_s.820 = alloca i64
  %local.sum_neg_dh.821 = alloca i64
  %local.sum_s2.822 = alloca i64
  %local.sum_dh2.823 = alloca i64
  %local.sum_s_dh.824 = alloca i64
  %local.s.825 = alloca i64
  %local.h1.826 = alloca i64
  %local.h2.827 = alloca i64
  %local.dh.828 = alloca i64
  %local.neg_dh.829 = alloca i64
  %local.nf.830 = alloca i64
  %local.num.831 = alloca i64
  %local.da.832 = alloca i64
  %local.db.833 = alloca i64
  %local.corr.834 = alloca i64
  %t835 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.57)
  %t836 = ptrtoint ptr %t835 to i64
  %t837 = inttoptr i64 %t836 to ptr
  call void @intrinsic_println(ptr %t837)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.58)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_println(ptr %t840)
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.59)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_println(ptr %t843)
  %t844 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.60)
  %t845 = ptrtoint ptr %t844 to i64
  %t846 = inttoptr i64 %t845 to ptr
  call void @intrinsic_println(ptr %t846)
  %t847 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.61)
  %t848 = ptrtoint ptr %t847 to i64
  %t849 = inttoptr i64 %t848 to ptr
  call void @intrinsic_println(ptr %t849)
  %t850 = call i64 @f64_parse(ptr @.str.exp_s_entropy.62)
  store i64 %t850, ptr %local.r.817
  store i64 0, ptr %local.agree.818
  store i64 0, ptr %local.total.819
  %t851 = call i64 @f64_parse(ptr @.str.exp_s_entropy.63)
  store i64 %t851, ptr %local.sum_s.820
  %t852 = call i64 @f64_parse(ptr @.str.exp_s_entropy.64)
  store i64 %t852, ptr %local.sum_neg_dh.821
  %t853 = call i64 @f64_parse(ptr @.str.exp_s_entropy.65)
  store i64 %t853, ptr %local.sum_s2.822
  %t854 = call i64 @f64_parse(ptr @.str.exp_s_entropy.66)
  store i64 %t854, ptr %local.sum_dh2.823
  %t855 = call i64 @f64_parse(ptr @.str.exp_s_entropy.67)
  store i64 %t855, ptr %local.sum_s_dh.824
  br label %loop59
loop59:
  %t856 = load i64, ptr %local.r.817
  %t857 = call i64 @f64_parse(ptr @.str.exp_s_entropy.68)
  %t858 = call i64 @"sx_f64_lt"(i64 %t856, i64 %t857)
  %t859 = icmp ne i64 %t858, 0
  br i1 %t859, label %body59, label %endloop59
body59:
  %t860 = load i64, ptr %local.r.817
  %t861 = call i64 @"logistic_S"(i64 %t860)
  store i64 %t861, ptr %local.s.825
  %t862 = load i64, ptr %local.r.817
  %t863 = call i64 @"window_entropy"(i64 %t862, i64 200, i64 300)
  store i64 %t863, ptr %local.h1.826
  %t864 = load i64, ptr %local.r.817
  %t865 = call i64 @"window_entropy"(i64 %t864, i64 800, i64 300)
  store i64 %t865, ptr %local.h2.827
  %t866 = load i64, ptr %local.h2.827
  %t867 = load i64, ptr %local.h1.826
  %t868 = call i64 @"sx_f64_sub"(i64 %t866, i64 %t867)
  store i64 %t868, ptr %local.dh.828
  %t869 = call i64 @f64_parse(ptr @.str.exp_s_entropy.69)
  %t870 = load i64, ptr %local.dh.828
  %t871 = call i64 @"sx_f64_sub"(i64 %t869, i64 %t870)
  store i64 %t871, ptr %local.neg_dh.829
  %t872 = load i64, ptr %local.sum_s.820
  %t873 = load i64, ptr %local.s.825
  %t874 = call i64 @"sx_f64_add"(i64 %t872, i64 %t873)
  store i64 %t874, ptr %local.sum_s.820
  %t875 = load i64, ptr %local.sum_neg_dh.821
  %t876 = load i64, ptr %local.neg_dh.829
  %t877 = call i64 @"sx_f64_add"(i64 %t875, i64 %t876)
  store i64 %t877, ptr %local.sum_neg_dh.821
  %t878 = load i64, ptr %local.sum_s2.822
  %t879 = load i64, ptr %local.s.825
  %t880 = load i64, ptr %local.s.825
  %t881 = call i64 @"sx_f64_mul"(i64 %t879, i64 %t880)
  %t882 = call i64 @"sx_f64_add"(i64 %t878, i64 %t881)
  store i64 %t882, ptr %local.sum_s2.822
  %t883 = load i64, ptr %local.sum_dh2.823
  %t884 = load i64, ptr %local.neg_dh.829
  %t885 = load i64, ptr %local.neg_dh.829
  %t886 = call i64 @"sx_f64_mul"(i64 %t884, i64 %t885)
  %t887 = call i64 @"sx_f64_add"(i64 %t883, i64 %t886)
  store i64 %t887, ptr %local.sum_dh2.823
  %t888 = load i64, ptr %local.sum_s_dh.824
  %t889 = load i64, ptr %local.s.825
  %t890 = load i64, ptr %local.neg_dh.829
  %t891 = call i64 @"sx_f64_mul"(i64 %t889, i64 %t890)
  %t892 = call i64 @"sx_f64_add"(i64 %t888, i64 %t891)
  store i64 %t892, ptr %local.sum_s_dh.824
  %t893 = load i64, ptr %local.total.819
  %t894 = add i64 %t893, 1
  store i64 %t894, ptr %local.total.819
  %t895 = load i64, ptr %local.s.825
  %t896 = call i64 @f64_parse(ptr @.str.exp_s_entropy.70)
  %t897 = call i64 @"sx_f64_gt"(i64 %t895, i64 %t896)
  %t898 = icmp ne i64 %t897, 0
  br i1 %t898, label %then60, label %else60
then60:
  %t899 = load i64, ptr %local.dh.828
  %t900 = call i64 @f64_parse(ptr @.str.exp_s_entropy.71)
  %t901 = call i64 @f64_parse(ptr @.str.exp_s_entropy.72)
  %t902 = call i64 @"sx_f64_sub"(i64 %t900, i64 %t901)
  %t903 = call i64 @"sx_f64_lt"(i64 %t899, i64 %t902)
  %t904 = icmp ne i64 %t903, 0
  br i1 %t904, label %then61, label %else61
then61:
  %t905 = load i64, ptr %local.agree.818
  %t906 = add i64 %t905, 1
  store i64 %t906, ptr %local.agree.818
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t907 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t908 = phi i64 [ %t907, %then60_end ], [ 0, %else60_end ]
  %t909 = load i64, ptr %local.s.825
  %t910 = call i64 @f64_parse(ptr @.str.exp_s_entropy.73)
  %t911 = call i64 @f64_parse(ptr @.str.exp_s_entropy.74)
  %t912 = call i64 @"sx_f64_sub"(i64 %t910, i64 %t911)
  %t913 = call i64 @"sx_f64_lt"(i64 %t909, i64 %t912)
  %t914 = icmp ne i64 %t913, 0
  br i1 %t914, label %then62, label %else62
then62:
  %t915 = load i64, ptr %local.dh.828
  %t916 = call i64 @f64_parse(ptr @.str.exp_s_entropy.75)
  %t917 = call i64 @"sx_f64_gt"(i64 %t915, i64 %t916)
  %t918 = icmp ne i64 %t917, 0
  br i1 %t918, label %then63, label %else63
then63:
  %t919 = load i64, ptr %local.agree.818
  %t920 = add i64 %t919, 1
  store i64 %t920, ptr %local.agree.818
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t921 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t922 = phi i64 [ %t921, %then62_end ], [ 0, %else62_end ]
  %t923 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.76)
  %t924 = ptrtoint ptr %t923 to i64
  %t925 = inttoptr i64 %t924 to ptr
  call void @intrinsic_print(ptr %t925)
  %t926 = load i64, ptr %local.r.817
  %t927 = call i64 @"print_f64"(i64 %t926)
  %t928 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.77)
  %t929 = ptrtoint ptr %t928 to i64
  %t930 = inttoptr i64 %t929 to ptr
  call void @intrinsic_print(ptr %t930)
  %t931 = load i64, ptr %local.s.825
  %t932 = call i64 @"print_f64"(i64 %t931)
  %t933 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.78)
  %t934 = ptrtoint ptr %t933 to i64
  %t935 = inttoptr i64 %t934 to ptr
  call void @intrinsic_print(ptr %t935)
  %t936 = load i64, ptr %local.h1.826
  %t937 = call i64 @"print_f64"(i64 %t936)
  %t938 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.79)
  %t939 = ptrtoint ptr %t938 to i64
  %t940 = inttoptr i64 %t939 to ptr
  call void @intrinsic_print(ptr %t940)
  %t941 = load i64, ptr %local.h2.827
  %t942 = call i64 @"print_f64"(i64 %t941)
  %t943 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.80)
  %t944 = ptrtoint ptr %t943 to i64
  %t945 = inttoptr i64 %t944 to ptr
  call void @intrinsic_print(ptr %t945)
  %t946 = load i64, ptr %local.dh.828
  %t947 = call i64 @"print_f64"(i64 %t946)
  %t948 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.81)
  %t949 = ptrtoint ptr %t948 to i64
  %t950 = inttoptr i64 %t949 to ptr
  call void @intrinsic_print(ptr %t950)
  %t951 = load i64, ptr %local.neg_dh.829
  %t952 = call i64 @"print_f64"(i64 %t951)
  %t953 = load i64, ptr %local.s.825
  %t954 = call i64 @f64_parse(ptr @.str.exp_s_entropy.82)
  %t955 = call i64 @"sx_f64_gt"(i64 %t953, i64 %t954)
  %t956 = icmp ne i64 %t955, 0
  br i1 %t956, label %then64, label %else64
then64:
  %t957 = load i64, ptr %local.dh.828
  %t958 = call i64 @f64_parse(ptr @.str.exp_s_entropy.83)
  %t959 = call i64 @"sx_f64_lt"(i64 %t957, i64 %t958)
  %t960 = icmp ne i64 %t959, 0
  br i1 %t960, label %then65, label %else65
then65:
  %t961 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.84)
  %t962 = ptrtoint ptr %t961 to i64
  %t963 = inttoptr i64 %t962 to ptr
  call void @intrinsic_println(ptr %t963)
  br label %then65_end
then65_end:
  br label %endif65
else65:
  %t964 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.85)
  %t965 = ptrtoint ptr %t964 to i64
  %t966 = inttoptr i64 %t965 to ptr
  call void @intrinsic_println(ptr %t966)
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t967 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  br label %then64_end
then64_end:
  br label %endif64
else64:
  %t968 = load i64, ptr %local.s.825
  %t969 = call i64 @f64_parse(ptr @.str.exp_s_entropy.86)
  %t970 = call i64 @f64_parse(ptr @.str.exp_s_entropy.87)
  %t971 = call i64 @"sx_f64_sub"(i64 %t969, i64 %t970)
  %t972 = call i64 @"sx_f64_lt"(i64 %t968, i64 %t971)
  %t973 = icmp ne i64 %t972, 0
  br i1 %t973, label %then66, label %else66
then66:
  %t974 = load i64, ptr %local.dh.828
  %t975 = call i64 @f64_parse(ptr @.str.exp_s_entropy.88)
  %t976 = call i64 @"sx_f64_gt"(i64 %t974, i64 %t975)
  %t977 = icmp ne i64 %t976, 0
  br i1 %t977, label %then67, label %else67
then67:
  %t978 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.89)
  %t979 = ptrtoint ptr %t978 to i64
  %t980 = inttoptr i64 %t979 to ptr
  call void @intrinsic_println(ptr %t980)
  br label %then67_end
then67_end:
  br label %endif67
else67:
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.90)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t984 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  br label %then66_end
then66_end:
  br label %endif66
else66:
  %t985 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.91)
  %t986 = ptrtoint ptr %t985 to i64
  %t987 = inttoptr i64 %t986 to ptr
  call void @intrinsic_println(ptr %t987)
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t988 = phi i64 [ %t984, %then66_end ], [ 0, %else66_end ]
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t989 = phi i64 [ %t967, %then64_end ], [ %t988, %else64_end ]
  %t990 = load i64, ptr %local.r.817
  %t991 = call i64 @f64_parse(ptr @.str.exp_s_entropy.92)
  %t992 = call i64 @"sx_f64_add"(i64 %t990, i64 %t991)
  store i64 %t992, ptr %local.r.817
  br label %loop59
endloop59:
  %t993 = load i64, ptr %local.total.819
  %t994 = call i64 @"sx_int_to_f64"(i64 %t993)
  store i64 %t994, ptr %local.nf.830
  %t995 = load i64, ptr %local.nf.830
  %t996 = load i64, ptr %local.sum_s_dh.824
  %t997 = call i64 @"sx_f64_mul"(i64 %t995, i64 %t996)
  %t998 = load i64, ptr %local.sum_s.820
  %t999 = load i64, ptr %local.sum_neg_dh.821
  %t1000 = call i64 @"sx_f64_mul"(i64 %t998, i64 %t999)
  %t1001 = call i64 @"sx_f64_sub"(i64 %t997, i64 %t1000)
  store i64 %t1001, ptr %local.num.831
  %t1002 = load i64, ptr %local.nf.830
  %t1003 = load i64, ptr %local.sum_s2.822
  %t1004 = call i64 @"sx_f64_mul"(i64 %t1002, i64 %t1003)
  %t1005 = load i64, ptr %local.sum_s.820
  %t1006 = load i64, ptr %local.sum_s.820
  %t1007 = call i64 @"sx_f64_mul"(i64 %t1005, i64 %t1006)
  %t1008 = call i64 @"sx_f64_sub"(i64 %t1004, i64 %t1007)
  store i64 %t1008, ptr %local.da.832
  %t1009 = load i64, ptr %local.nf.830
  %t1010 = load i64, ptr %local.sum_dh2.823
  %t1011 = call i64 @"sx_f64_mul"(i64 %t1009, i64 %t1010)
  %t1012 = load i64, ptr %local.sum_neg_dh.821
  %t1013 = load i64, ptr %local.sum_neg_dh.821
  %t1014 = call i64 @"sx_f64_mul"(i64 %t1012, i64 %t1013)
  %t1015 = call i64 @"sx_f64_sub"(i64 %t1011, i64 %t1014)
  store i64 %t1015, ptr %local.db.833
  %t1016 = call i64 @f64_parse(ptr @.str.exp_s_entropy.93)
  store i64 %t1016, ptr %local.corr.834
  %t1017 = load i64, ptr %local.da.832
  %t1018 = call i64 @f64_parse(ptr @.str.exp_s_entropy.94)
  %t1019 = call i64 @"sx_f64_gt"(i64 %t1017, i64 %t1018)
  %t1020 = icmp ne i64 %t1019, 0
  br i1 %t1020, label %then68, label %else68
then68:
  %t1021 = load i64, ptr %local.db.833
  %t1022 = call i64 @f64_parse(ptr @.str.exp_s_entropy.95)
  %t1023 = call i64 @"sx_f64_gt"(i64 %t1021, i64 %t1022)
  %t1024 = icmp ne i64 %t1023, 0
  br i1 %t1024, label %then69, label %else69
then69:
  %t1025 = load i64, ptr %local.num.831
  %t1026 = load i64, ptr %local.da.832
  %t1027 = load i64, ptr %local.db.833
  %t1028 = call i64 @"sx_f64_mul"(i64 %t1026, i64 %t1027)
  %t1029 = call i64 @"sqrt_f64"(i64 %t1028)
  %t1030 = call i64 @"sx_f64_div"(i64 %t1025, i64 %t1029)
  store i64 %t1030, ptr %local.corr.834
  br label %then69_end
then69_end:
  br label %endif69
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t1031 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  br label %then68_end
then68_end:
  br label %endif68
else68:
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t1032 = phi i64 [ %t1031, %then68_end ], [ 0, %else68_end ]
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.96)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_println(ptr %t1035)
  %t1036 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.97)
  %t1037 = ptrtoint ptr %t1036 to i64
  %t1038 = inttoptr i64 %t1037 to ptr
  call void @intrinsic_print(ptr %t1038)
  %t1039 = load i64, ptr %local.agree.818
  call void @print_i64(i64 %t1039)
  %t1040 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.98)
  %t1041 = ptrtoint ptr %t1040 to i64
  %t1042 = inttoptr i64 %t1041 to ptr
  call void @intrinsic_print(ptr %t1042)
  %t1043 = load i64, ptr %local.total.819
  call void @print_i64(i64 %t1043)
  %t1044 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.99)
  %t1045 = ptrtoint ptr %t1044 to i64
  %t1046 = inttoptr i64 %t1045 to ptr
  call void @intrinsic_println(ptr %t1046)
  %t1047 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.100)
  %t1048 = ptrtoint ptr %t1047 to i64
  %t1049 = inttoptr i64 %t1048 to ptr
  call void @intrinsic_print(ptr %t1049)
  %t1050 = load i64, ptr %local.corr.834
  %t1051 = call i64 @"print_f64"(i64 %t1050)
  %t1052 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.101)
  %t1053 = ptrtoint ptr %t1052 to i64
  %t1054 = inttoptr i64 %t1053 to ptr
  call void @intrinsic_println(ptr %t1054)
  %t1055 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.102)
  %t1056 = ptrtoint ptr %t1055 to i64
  %t1057 = inttoptr i64 %t1056 to ptr
  call void @intrinsic_println(ptr %t1057)
  %t1058 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.103)
  %t1059 = ptrtoint ptr %t1058 to i64
  %t1060 = inttoptr i64 %t1059 to ptr
  call void @intrinsic_println(ptr %t1060)
  ret i64 0
}

define i64 @"logistic_lyapunov"(i64 %r) nounwind {
entry:
  %local.x.1061 = alloca i64
  %local.sum.1062 = alloca i64
  %local.step.1063 = alloca i64
  %local.deriv.1064 = alloca i64
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %t1065 = call i64 @f64_parse(ptr @.str.exp_s_entropy.104)
  store i64 %t1065, ptr %local.x.1061
  %t1066 = call i64 @f64_parse(ptr @.str.exp_s_entropy.105)
  store i64 %t1066, ptr %local.sum.1062
  store i64 0, ptr %local.step.1063
  br label %loop70
loop70:
  %t1067 = load i64, ptr %local.step.1063
  %t1068 = icmp slt i64 %t1067, 500
  %t1069 = zext i1 %t1068 to i64
  %t1070 = icmp ne i64 %t1069, 0
  br i1 %t1070, label %body70, label %endloop70
body70:
  %t1071 = load i64, ptr %local.r
  %t1072 = load i64, ptr %local.x.1061
  %t1073 = call i64 @"sx_f64_mul"(i64 %t1071, i64 %t1072)
  %t1074 = call i64 @f64_parse(ptr @.str.exp_s_entropy.106)
  %t1075 = load i64, ptr %local.x.1061
  %t1076 = call i64 @"sx_f64_sub"(i64 %t1074, i64 %t1075)
  %t1077 = call i64 @"sx_f64_mul"(i64 %t1073, i64 %t1076)
  store i64 %t1077, ptr %local.x.1061
  %t1078 = load i64, ptr %local.step.1063
  %t1079 = add i64 %t1078, 1
  store i64 %t1079, ptr %local.step.1063
  br label %loop70
endloop70:
  store i64 0, ptr %local.step.1063
  br label %loop71
loop71:
  %t1080 = load i64, ptr %local.step.1063
  %t1081 = icmp slt i64 %t1080, 5000
  %t1082 = zext i1 %t1081 to i64
  %t1083 = icmp ne i64 %t1082, 0
  br i1 %t1083, label %body71, label %endloop71
body71:
  %t1084 = load i64, ptr %local.r
  %t1085 = load i64, ptr %local.x.1061
  %t1086 = call i64 @"sx_f64_mul"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @f64_parse(ptr @.str.exp_s_entropy.107)
  %t1088 = load i64, ptr %local.x.1061
  %t1089 = call i64 @"sx_f64_sub"(i64 %t1087, i64 %t1088)
  %t1090 = call i64 @"sx_f64_mul"(i64 %t1086, i64 %t1089)
  store i64 %t1090, ptr %local.x.1061
  %t1091 = load i64, ptr %local.r
  %t1092 = call i64 @f64_parse(ptr @.str.exp_s_entropy.108)
  %t1093 = call i64 @f64_parse(ptr @.str.exp_s_entropy.109)
  %t1094 = load i64, ptr %local.x.1061
  %t1095 = call i64 @"sx_f64_mul"(i64 %t1093, i64 %t1094)
  %t1096 = call i64 @"sx_f64_sub"(i64 %t1092, i64 %t1095)
  %t1097 = call i64 @"sx_f64_mul"(i64 %t1091, i64 %t1096)
  %t1098 = call i64 @"abs_f64"(i64 %t1097)
  store i64 %t1098, ptr %local.deriv.1064
  %t1099 = load i64, ptr %local.deriv.1064
  %t1100 = call i64 @f64_parse(ptr @.str.exp_s_entropy.110)
  %t1101 = call i64 @"sx_f64_gt"(i64 %t1099, i64 %t1100)
  %t1102 = icmp ne i64 %t1101, 0
  br i1 %t1102, label %then72, label %else72
then72:
  %t1103 = load i64, ptr %local.sum.1062
  %t1104 = load i64, ptr %local.deriv.1064
  %t1105 = call i64 @"ln_f64"(i64 %t1104)
  %t1106 = call i64 @"sx_f64_add"(i64 %t1103, i64 %t1105)
  store i64 %t1106, ptr %local.sum.1062
  br label %then72_end
then72_end:
  br label %endif72
else72:
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t1107 = phi i64 [ 0, %then72_end ], [ 0, %else72_end ]
  %t1108 = load i64, ptr %local.step.1063
  %t1109 = add i64 %t1108, 1
  store i64 %t1109, ptr %local.step.1063
  br label %loop71
endloop71:
  %t1110 = load i64, ptr %local.sum.1062
  %t1111 = call i64 @f64_parse(ptr @.str.exp_s_entropy.111)
  %t1112 = call i64 @"sx_f64_div"(i64 %t1110, i64 %t1111)
  ret i64 %t1112
}

define i64 @"test_s_vs_ks"() nounwind {
entry:
  %local.r.1113 = alloca i64
  %local.ks_max.1114 = alloca i64
  %local.lam.1115 = alloca i64
  %local.ks.1116 = alloca i64
  %local.sum_s.1117 = alloca i64
  %local.sum_ks.1118 = alloca i64
  %local.sum_s2.1119 = alloca i64
  %local.sum_ks2.1120 = alloca i64
  %local.sum_sks.1121 = alloca i64
  %local.n.1122 = alloca i64
  %local.s.1123 = alloca i64
  %local.lam.1124 = alloca i64
  %local.ks.1125 = alloca i64
  %local.norm_ks.1126 = alloca i64
  %local.nf.1127 = alloca i64
  %local.num.1128 = alloca i64
  %local.da.1129 = alloca i64
  %local.db.1130 = alloca i64
  %local.corr.1131 = alloca i64
  %t1132 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.112)
  %t1133 = ptrtoint ptr %t1132 to i64
  %t1134 = inttoptr i64 %t1133 to ptr
  call void @intrinsic_println(ptr %t1134)
  %t1135 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.113)
  %t1136 = ptrtoint ptr %t1135 to i64
  %t1137 = inttoptr i64 %t1136 to ptr
  call void @intrinsic_println(ptr %t1137)
  %t1138 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.114)
  %t1139 = ptrtoint ptr %t1138 to i64
  %t1140 = inttoptr i64 %t1139 to ptr
  call void @intrinsic_println(ptr %t1140)
  %t1141 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.115)
  %t1142 = ptrtoint ptr %t1141 to i64
  %t1143 = inttoptr i64 %t1142 to ptr
  call void @intrinsic_println(ptr %t1143)
  %t1144 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.116)
  %t1145 = ptrtoint ptr %t1144 to i64
  %t1146 = inttoptr i64 %t1145 to ptr
  call void @intrinsic_println(ptr %t1146)
  %t1147 = call i64 @f64_parse(ptr @.str.exp_s_entropy.117)
  store i64 %t1147, ptr %local.r.1113
  %t1148 = call i64 @f64_parse(ptr @.str.exp_s_entropy.118)
  store i64 %t1148, ptr %local.ks_max.1114
  br label %loop73
loop73:
  %t1149 = load i64, ptr %local.r.1113
  %t1150 = call i64 @f64_parse(ptr @.str.exp_s_entropy.119)
  %t1151 = call i64 @"sx_f64_lt"(i64 %t1149, i64 %t1150)
  %t1152 = icmp ne i64 %t1151, 0
  br i1 %t1152, label %body73, label %endloop73
body73:
  %t1153 = load i64, ptr %local.r.1113
  %t1154 = call i64 @"logistic_lyapunov"(i64 %t1153)
  store i64 %t1154, ptr %local.lam.1115
  %t1155 = load i64, ptr %local.lam.1115
  store i64 %t1155, ptr %local.ks.1116
  %t1156 = load i64, ptr %local.ks.1116
  %t1157 = call i64 @f64_parse(ptr @.str.exp_s_entropy.120)
  %t1158 = call i64 @"sx_f64_lt"(i64 %t1156, i64 %t1157)
  %t1159 = icmp ne i64 %t1158, 0
  br i1 %t1159, label %then74, label %else74
then74:
  %t1160 = call i64 @f64_parse(ptr @.str.exp_s_entropy.121)
  store i64 %t1160, ptr %local.ks.1116
  br label %then74_end
then74_end:
  br label %endif74
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t1161 = phi i64 [ 0, %then74_end ], [ 0, %else74_end ]
  %t1162 = load i64, ptr %local.ks.1116
  %t1163 = load i64, ptr %local.ks_max.1114
  %t1164 = call i64 @"sx_f64_gt"(i64 %t1162, i64 %t1163)
  %t1165 = icmp ne i64 %t1164, 0
  br i1 %t1165, label %then75, label %else75
then75:
  %t1166 = load i64, ptr %local.ks.1116
  store i64 %t1166, ptr %local.ks_max.1114
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t1167 = phi i64 [ 0, %then75_end ], [ 0, %else75_end ]
  %t1168 = load i64, ptr %local.r.1113
  %t1169 = call i64 @f64_parse(ptr @.str.exp_s_entropy.122)
  %t1170 = call i64 @"sx_f64_add"(i64 %t1168, i64 %t1169)
  store i64 %t1170, ptr %local.r.1113
  br label %loop73
endloop73:
  %t1171 = call i64 @f64_parse(ptr @.str.exp_s_entropy.123)
  store i64 %t1171, ptr %local.r.1113
  %t1172 = call i64 @f64_parse(ptr @.str.exp_s_entropy.124)
  store i64 %t1172, ptr %local.sum_s.1117
  %t1173 = call i64 @f64_parse(ptr @.str.exp_s_entropy.125)
  store i64 %t1173, ptr %local.sum_ks.1118
  %t1174 = call i64 @f64_parse(ptr @.str.exp_s_entropy.126)
  store i64 %t1174, ptr %local.sum_s2.1119
  %t1175 = call i64 @f64_parse(ptr @.str.exp_s_entropy.127)
  store i64 %t1175, ptr %local.sum_ks2.1120
  %t1176 = call i64 @f64_parse(ptr @.str.exp_s_entropy.128)
  store i64 %t1176, ptr %local.sum_sks.1121
  store i64 0, ptr %local.n.1122
  br label %loop76
loop76:
  %t1177 = load i64, ptr %local.r.1113
  %t1178 = call i64 @f64_parse(ptr @.str.exp_s_entropy.129)
  %t1179 = call i64 @"sx_f64_lt"(i64 %t1177, i64 %t1178)
  %t1180 = icmp ne i64 %t1179, 0
  br i1 %t1180, label %body76, label %endloop76
body76:
  %t1181 = load i64, ptr %local.r.1113
  %t1182 = call i64 @"logistic_S"(i64 %t1181)
  store i64 %t1182, ptr %local.s.1123
  %t1183 = load i64, ptr %local.r.1113
  %t1184 = call i64 @"logistic_lyapunov"(i64 %t1183)
  store i64 %t1184, ptr %local.lam.1124
  %t1185 = load i64, ptr %local.lam.1124
  store i64 %t1185, ptr %local.ks.1125
  %t1186 = load i64, ptr %local.ks.1125
  %t1187 = call i64 @f64_parse(ptr @.str.exp_s_entropy.130)
  %t1188 = call i64 @"sx_f64_lt"(i64 %t1186, i64 %t1187)
  %t1189 = icmp ne i64 %t1188, 0
  br i1 %t1189, label %then77, label %else77
then77:
  %t1190 = call i64 @f64_parse(ptr @.str.exp_s_entropy.131)
  store i64 %t1190, ptr %local.ks.1125
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t1191 = phi i64 [ 0, %then77_end ], [ 0, %else77_end ]
  %t1192 = call i64 @f64_parse(ptr @.str.exp_s_entropy.132)
  store i64 %t1192, ptr %local.norm_ks.1126
  %t1193 = load i64, ptr %local.ks_max.1114
  %t1194 = call i64 @f64_parse(ptr @.str.exp_s_entropy.133)
  %t1195 = call i64 @"sx_f64_gt"(i64 %t1193, i64 %t1194)
  %t1196 = icmp ne i64 %t1195, 0
  br i1 %t1196, label %then78, label %else78
then78:
  %t1197 = call i64 @f64_parse(ptr @.str.exp_s_entropy.134)
  %t1198 = load i64, ptr %local.ks.1125
  %t1199 = load i64, ptr %local.ks_max.1114
  %t1200 = call i64 @"sx_f64_div"(i64 %t1198, i64 %t1199)
  %t1201 = call i64 @"sx_f64_sub"(i64 %t1197, i64 %t1200)
  store i64 %t1201, ptr %local.norm_ks.1126
  br label %then78_end
then78_end:
  br label %endif78
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t1202 = phi i64 [ 0, %then78_end ], [ 0, %else78_end ]
  %t1203 = load i64, ptr %local.sum_s.1117
  %t1204 = load i64, ptr %local.s.1123
  %t1205 = call i64 @"sx_f64_add"(i64 %t1203, i64 %t1204)
  store i64 %t1205, ptr %local.sum_s.1117
  %t1206 = load i64, ptr %local.sum_ks.1118
  %t1207 = load i64, ptr %local.ks.1125
  %t1208 = call i64 @"sx_f64_add"(i64 %t1206, i64 %t1207)
  store i64 %t1208, ptr %local.sum_ks.1118
  %t1209 = load i64, ptr %local.sum_s2.1119
  %t1210 = load i64, ptr %local.s.1123
  %t1211 = load i64, ptr %local.s.1123
  %t1212 = call i64 @"sx_f64_mul"(i64 %t1210, i64 %t1211)
  %t1213 = call i64 @"sx_f64_add"(i64 %t1209, i64 %t1212)
  store i64 %t1213, ptr %local.sum_s2.1119
  %t1214 = load i64, ptr %local.sum_ks2.1120
  %t1215 = load i64, ptr %local.ks.1125
  %t1216 = load i64, ptr %local.ks.1125
  %t1217 = call i64 @"sx_f64_mul"(i64 %t1215, i64 %t1216)
  %t1218 = call i64 @"sx_f64_add"(i64 %t1214, i64 %t1217)
  store i64 %t1218, ptr %local.sum_ks2.1120
  %t1219 = load i64, ptr %local.sum_sks.1121
  %t1220 = load i64, ptr %local.s.1123
  %t1221 = load i64, ptr %local.ks.1125
  %t1222 = call i64 @"sx_f64_mul"(i64 %t1220, i64 %t1221)
  %t1223 = call i64 @"sx_f64_add"(i64 %t1219, i64 %t1222)
  store i64 %t1223, ptr %local.sum_sks.1121
  %t1224 = load i64, ptr %local.n.1122
  %t1225 = add i64 %t1224, 1
  store i64 %t1225, ptr %local.n.1122
  %t1226 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.135)
  %t1227 = ptrtoint ptr %t1226 to i64
  %t1228 = inttoptr i64 %t1227 to ptr
  call void @intrinsic_print(ptr %t1228)
  %t1229 = load i64, ptr %local.r.1113
  %t1230 = call i64 @"print_f64"(i64 %t1229)
  %t1231 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.136)
  %t1232 = ptrtoint ptr %t1231 to i64
  %t1233 = inttoptr i64 %t1232 to ptr
  call void @intrinsic_print(ptr %t1233)
  %t1234 = load i64, ptr %local.s.1123
  %t1235 = call i64 @"print_f64"(i64 %t1234)
  %t1236 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.137)
  %t1237 = ptrtoint ptr %t1236 to i64
  %t1238 = inttoptr i64 %t1237 to ptr
  call void @intrinsic_print(ptr %t1238)
  %t1239 = load i64, ptr %local.lam.1124
  %t1240 = call i64 @"print_f64"(i64 %t1239)
  %t1241 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.138)
  %t1242 = ptrtoint ptr %t1241 to i64
  %t1243 = inttoptr i64 %t1242 to ptr
  call void @intrinsic_print(ptr %t1243)
  %t1244 = load i64, ptr %local.ks.1125
  %t1245 = call i64 @"print_f64"(i64 %t1244)
  %t1246 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.139)
  %t1247 = ptrtoint ptr %t1246 to i64
  %t1248 = inttoptr i64 %t1247 to ptr
  call void @intrinsic_print(ptr %t1248)
  %t1249 = load i64, ptr %local.norm_ks.1126
  %t1250 = call i64 @"print_f64"(i64 %t1249)
  %t1251 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.140)
  %t1252 = ptrtoint ptr %t1251 to i64
  %t1253 = inttoptr i64 %t1252 to ptr
  call void @intrinsic_print(ptr %t1253)
  %t1254 = load i64, ptr %local.s.1123
  %t1255 = load i64, ptr %local.ks.1125
  %t1256 = call i64 @"sx_f64_add"(i64 %t1254, i64 %t1255)
  %t1257 = call i64 @"print_f64"(i64 %t1256)
  %t1258 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.141)
  %t1259 = ptrtoint ptr %t1258 to i64
  %t1260 = inttoptr i64 %t1259 to ptr
  call void @intrinsic_println(ptr %t1260)
  %t1261 = load i64, ptr %local.r.1113
  %t1262 = call i64 @f64_parse(ptr @.str.exp_s_entropy.142)
  %t1263 = call i64 @"sx_f64_add"(i64 %t1261, i64 %t1262)
  store i64 %t1263, ptr %local.r.1113
  br label %loop76
endloop76:
  %t1264 = load i64, ptr %local.n.1122
  %t1265 = call i64 @"sx_int_to_f64"(i64 %t1264)
  store i64 %t1265, ptr %local.nf.1127
  %t1266 = load i64, ptr %local.nf.1127
  %t1267 = load i64, ptr %local.sum_sks.1121
  %t1268 = call i64 @"sx_f64_mul"(i64 %t1266, i64 %t1267)
  %t1269 = load i64, ptr %local.sum_s.1117
  %t1270 = load i64, ptr %local.sum_ks.1118
  %t1271 = call i64 @"sx_f64_mul"(i64 %t1269, i64 %t1270)
  %t1272 = call i64 @"sx_f64_sub"(i64 %t1268, i64 %t1271)
  store i64 %t1272, ptr %local.num.1128
  %t1273 = load i64, ptr %local.nf.1127
  %t1274 = load i64, ptr %local.sum_s2.1119
  %t1275 = call i64 @"sx_f64_mul"(i64 %t1273, i64 %t1274)
  %t1276 = load i64, ptr %local.sum_s.1117
  %t1277 = load i64, ptr %local.sum_s.1117
  %t1278 = call i64 @"sx_f64_mul"(i64 %t1276, i64 %t1277)
  %t1279 = call i64 @"sx_f64_sub"(i64 %t1275, i64 %t1278)
  store i64 %t1279, ptr %local.da.1129
  %t1280 = load i64, ptr %local.nf.1127
  %t1281 = load i64, ptr %local.sum_ks2.1120
  %t1282 = call i64 @"sx_f64_mul"(i64 %t1280, i64 %t1281)
  %t1283 = load i64, ptr %local.sum_ks.1118
  %t1284 = load i64, ptr %local.sum_ks.1118
  %t1285 = call i64 @"sx_f64_mul"(i64 %t1283, i64 %t1284)
  %t1286 = call i64 @"sx_f64_sub"(i64 %t1282, i64 %t1285)
  store i64 %t1286, ptr %local.db.1130
  %t1287 = call i64 @f64_parse(ptr @.str.exp_s_entropy.143)
  store i64 %t1287, ptr %local.corr.1131
  %t1288 = load i64, ptr %local.da.1129
  %t1289 = call i64 @f64_parse(ptr @.str.exp_s_entropy.144)
  %t1290 = call i64 @"sx_f64_gt"(i64 %t1288, i64 %t1289)
  %t1291 = icmp ne i64 %t1290, 0
  br i1 %t1291, label %then79, label %else79
then79:
  %t1292 = load i64, ptr %local.db.1130
  %t1293 = call i64 @f64_parse(ptr @.str.exp_s_entropy.145)
  %t1294 = call i64 @"sx_f64_gt"(i64 %t1292, i64 %t1293)
  %t1295 = icmp ne i64 %t1294, 0
  br i1 %t1295, label %then80, label %else80
then80:
  %t1296 = load i64, ptr %local.num.1128
  %t1297 = load i64, ptr %local.da.1129
  %t1298 = load i64, ptr %local.db.1130
  %t1299 = call i64 @"sx_f64_mul"(i64 %t1297, i64 %t1298)
  %t1300 = call i64 @"sqrt_f64"(i64 %t1299)
  %t1301 = call i64 @"sx_f64_div"(i64 %t1296, i64 %t1300)
  store i64 %t1301, ptr %local.corr.1131
  br label %then80_end
then80_end:
  br label %endif80
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t1302 = phi i64 [ 0, %then80_end ], [ 0, %else80_end ]
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t1303 = phi i64 [ %t1302, %then79_end ], [ 0, %else79_end ]
  %t1304 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.146)
  %t1305 = ptrtoint ptr %t1304 to i64
  %t1306 = inttoptr i64 %t1305 to ptr
  call void @intrinsic_println(ptr %t1306)
  %t1307 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.147)
  %t1308 = ptrtoint ptr %t1307 to i64
  %t1309 = inttoptr i64 %t1308 to ptr
  call void @intrinsic_print(ptr %t1309)
  %t1310 = load i64, ptr %local.ks_max.1114
  %t1311 = call i64 @"print_f64"(i64 %t1310)
  %t1312 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.148)
  %t1313 = ptrtoint ptr %t1312 to i64
  %t1314 = inttoptr i64 %t1313 to ptr
  call void @intrinsic_println(ptr %t1314)
  %t1315 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.149)
  %t1316 = ptrtoint ptr %t1315 to i64
  %t1317 = inttoptr i64 %t1316 to ptr
  call void @intrinsic_print(ptr %t1317)
  %t1318 = load i64, ptr %local.corr.1131
  %t1319 = call i64 @"print_f64"(i64 %t1318)
  %t1320 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.150)
  %t1321 = ptrtoint ptr %t1320 to i64
  %t1322 = inttoptr i64 %t1321 to ptr
  call void @intrinsic_println(ptr %t1322)
  %t1323 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.151)
  %t1324 = ptrtoint ptr %t1323 to i64
  %t1325 = inttoptr i64 %t1324 to ptr
  call void @intrinsic_println(ptr %t1325)
  %t1326 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.152)
  %t1327 = ptrtoint ptr %t1326 to i64
  %t1328 = inttoptr i64 %t1327 to ptr
  call void @intrinsic_println(ptr %t1328)
  %t1329 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.153)
  %t1330 = ptrtoint ptr %t1329 to i64
  %t1331 = inttoptr i64 %t1330 to ptr
  call void @intrinsic_println(ptr %t1331)
  %t1332 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.154)
  %t1333 = ptrtoint ptr %t1332 to i64
  %t1334 = inttoptr i64 %t1333 to ptr
  call void @intrinsic_println(ptr %t1334)
  ret i64 0
}

define i64 @"matrix_entropy_3x4"(i64 %a00, i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a11, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a22, i64 %a23) nounwind {
entry:
  %local.total.1335 = alloca i64
  %local.h.1336 = alloca i64
  %local.p.1337 = alloca i64
  %local.a00 = alloca i64
  store i64 %a00, ptr %local.a00
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a11 = alloca i64
  store i64 %a11, ptr %local.a11
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a22 = alloca i64
  store i64 %a22, ptr %local.a22
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %t1338 = call i64 @f64_parse(ptr @.str.exp_s_entropy.155)
  store i64 %t1338, ptr %local.total.1335
  %t1339 = load i64, ptr %local.total.1335
  %t1340 = load i64, ptr %local.a00
  %t1341 = call i64 @"abs_f64"(i64 %t1340)
  %t1342 = call i64 @"sx_f64_add"(i64 %t1339, i64 %t1341)
  %t1343 = load i64, ptr %local.a01
  %t1344 = call i64 @"abs_f64"(i64 %t1343)
  %t1345 = call i64 @"sx_f64_add"(i64 %t1342, i64 %t1344)
  %t1346 = load i64, ptr %local.a02
  %t1347 = call i64 @"abs_f64"(i64 %t1346)
  %t1348 = call i64 @"sx_f64_add"(i64 %t1345, i64 %t1347)
  %t1349 = load i64, ptr %local.a03
  %t1350 = call i64 @"abs_f64"(i64 %t1349)
  %t1351 = call i64 @"sx_f64_add"(i64 %t1348, i64 %t1350)
  store i64 %t1351, ptr %local.total.1335
  %t1352 = load i64, ptr %local.total.1335
  %t1353 = load i64, ptr %local.a10
  %t1354 = call i64 @"abs_f64"(i64 %t1353)
  %t1355 = call i64 @"sx_f64_add"(i64 %t1352, i64 %t1354)
  %t1356 = load i64, ptr %local.a11
  %t1357 = call i64 @"abs_f64"(i64 %t1356)
  %t1358 = call i64 @"sx_f64_add"(i64 %t1355, i64 %t1357)
  %t1359 = load i64, ptr %local.a12
  %t1360 = call i64 @"abs_f64"(i64 %t1359)
  %t1361 = call i64 @"sx_f64_add"(i64 %t1358, i64 %t1360)
  %t1362 = load i64, ptr %local.a13
  %t1363 = call i64 @"abs_f64"(i64 %t1362)
  %t1364 = call i64 @"sx_f64_add"(i64 %t1361, i64 %t1363)
  store i64 %t1364, ptr %local.total.1335
  %t1365 = load i64, ptr %local.total.1335
  %t1366 = load i64, ptr %local.a20
  %t1367 = call i64 @"abs_f64"(i64 %t1366)
  %t1368 = call i64 @"sx_f64_add"(i64 %t1365, i64 %t1367)
  %t1369 = load i64, ptr %local.a21
  %t1370 = call i64 @"abs_f64"(i64 %t1369)
  %t1371 = call i64 @"sx_f64_add"(i64 %t1368, i64 %t1370)
  %t1372 = load i64, ptr %local.a22
  %t1373 = call i64 @"abs_f64"(i64 %t1372)
  %t1374 = call i64 @"sx_f64_add"(i64 %t1371, i64 %t1373)
  %t1375 = load i64, ptr %local.a23
  %t1376 = call i64 @"abs_f64"(i64 %t1375)
  %t1377 = call i64 @"sx_f64_add"(i64 %t1374, i64 %t1376)
  store i64 %t1377, ptr %local.total.1335
  %t1378 = load i64, ptr %local.total.1335
  %t1379 = call i64 @f64_parse(ptr @.str.exp_s_entropy.156)
  %t1380 = call i64 @"sx_f64_lt"(i64 %t1378, i64 %t1379)
  %t1381 = icmp ne i64 %t1380, 0
  br i1 %t1381, label %then81, label %else81
then81:
  %t1382 = call i64 @f64_parse(ptr @.str.exp_s_entropy.157)
  ret i64 %t1382
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t1383 = phi i64 [ 0, %else81_end ]
  %t1384 = call i64 @f64_parse(ptr @.str.exp_s_entropy.158)
  store i64 %t1384, ptr %local.h.1336
  %t1385 = call i64 @f64_parse(ptr @.str.exp_s_entropy.159)
  store i64 %t1385, ptr %local.p.1337
  %t1386 = load i64, ptr %local.a00
  %t1387 = call i64 @"abs_f64"(i64 %t1386)
  %t1388 = load i64, ptr %local.total.1335
  %t1389 = call i64 @"sx_f64_div"(i64 %t1387, i64 %t1388)
  store i64 %t1389, ptr %local.p.1337
  %t1390 = load i64, ptr %local.p.1337
  %t1391 = call i64 @f64_parse(ptr @.str.exp_s_entropy.160)
  %t1392 = call i64 @"sx_f64_gt"(i64 %t1390, i64 %t1391)
  %t1393 = icmp ne i64 %t1392, 0
  br i1 %t1393, label %then82, label %else82
then82:
  %t1394 = load i64, ptr %local.h.1336
  %t1395 = load i64, ptr %local.p.1337
  %t1396 = load i64, ptr %local.p.1337
  %t1397 = call i64 @"ln_f64"(i64 %t1396)
  %t1398 = call i64 @"sx_f64_mul"(i64 %t1395, i64 %t1397)
  %t1399 = call i64 @"sx_f64_sub"(i64 %t1394, i64 %t1398)
  store i64 %t1399, ptr %local.h.1336
  br label %then82_end
then82_end:
  br label %endif82
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t1400 = phi i64 [ 0, %then82_end ], [ 0, %else82_end ]
  %t1401 = load i64, ptr %local.a01
  %t1402 = call i64 @"abs_f64"(i64 %t1401)
  %t1403 = load i64, ptr %local.total.1335
  %t1404 = call i64 @"sx_f64_div"(i64 %t1402, i64 %t1403)
  store i64 %t1404, ptr %local.p.1337
  %t1405 = load i64, ptr %local.p.1337
  %t1406 = call i64 @f64_parse(ptr @.str.exp_s_entropy.161)
  %t1407 = call i64 @"sx_f64_gt"(i64 %t1405, i64 %t1406)
  %t1408 = icmp ne i64 %t1407, 0
  br i1 %t1408, label %then83, label %else83
then83:
  %t1409 = load i64, ptr %local.h.1336
  %t1410 = load i64, ptr %local.p.1337
  %t1411 = load i64, ptr %local.p.1337
  %t1412 = call i64 @"ln_f64"(i64 %t1411)
  %t1413 = call i64 @"sx_f64_mul"(i64 %t1410, i64 %t1412)
  %t1414 = call i64 @"sx_f64_sub"(i64 %t1409, i64 %t1413)
  store i64 %t1414, ptr %local.h.1336
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t1415 = phi i64 [ 0, %then83_end ], [ 0, %else83_end ]
  %t1416 = load i64, ptr %local.a02
  %t1417 = call i64 @"abs_f64"(i64 %t1416)
  %t1418 = load i64, ptr %local.total.1335
  %t1419 = call i64 @"sx_f64_div"(i64 %t1417, i64 %t1418)
  store i64 %t1419, ptr %local.p.1337
  %t1420 = load i64, ptr %local.p.1337
  %t1421 = call i64 @f64_parse(ptr @.str.exp_s_entropy.162)
  %t1422 = call i64 @"sx_f64_gt"(i64 %t1420, i64 %t1421)
  %t1423 = icmp ne i64 %t1422, 0
  br i1 %t1423, label %then84, label %else84
then84:
  %t1424 = load i64, ptr %local.h.1336
  %t1425 = load i64, ptr %local.p.1337
  %t1426 = load i64, ptr %local.p.1337
  %t1427 = call i64 @"ln_f64"(i64 %t1426)
  %t1428 = call i64 @"sx_f64_mul"(i64 %t1425, i64 %t1427)
  %t1429 = call i64 @"sx_f64_sub"(i64 %t1424, i64 %t1428)
  store i64 %t1429, ptr %local.h.1336
  br label %then84_end
then84_end:
  br label %endif84
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t1430 = phi i64 [ 0, %then84_end ], [ 0, %else84_end ]
  %t1431 = load i64, ptr %local.a03
  %t1432 = call i64 @"abs_f64"(i64 %t1431)
  %t1433 = load i64, ptr %local.total.1335
  %t1434 = call i64 @"sx_f64_div"(i64 %t1432, i64 %t1433)
  store i64 %t1434, ptr %local.p.1337
  %t1435 = load i64, ptr %local.p.1337
  %t1436 = call i64 @f64_parse(ptr @.str.exp_s_entropy.163)
  %t1437 = call i64 @"sx_f64_gt"(i64 %t1435, i64 %t1436)
  %t1438 = icmp ne i64 %t1437, 0
  br i1 %t1438, label %then85, label %else85
then85:
  %t1439 = load i64, ptr %local.h.1336
  %t1440 = load i64, ptr %local.p.1337
  %t1441 = load i64, ptr %local.p.1337
  %t1442 = call i64 @"ln_f64"(i64 %t1441)
  %t1443 = call i64 @"sx_f64_mul"(i64 %t1440, i64 %t1442)
  %t1444 = call i64 @"sx_f64_sub"(i64 %t1439, i64 %t1443)
  store i64 %t1444, ptr %local.h.1336
  br label %then85_end
then85_end:
  br label %endif85
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t1445 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  %t1446 = load i64, ptr %local.a10
  %t1447 = call i64 @"abs_f64"(i64 %t1446)
  %t1448 = load i64, ptr %local.total.1335
  %t1449 = call i64 @"sx_f64_div"(i64 %t1447, i64 %t1448)
  store i64 %t1449, ptr %local.p.1337
  %t1450 = load i64, ptr %local.p.1337
  %t1451 = call i64 @f64_parse(ptr @.str.exp_s_entropy.164)
  %t1452 = call i64 @"sx_f64_gt"(i64 %t1450, i64 %t1451)
  %t1453 = icmp ne i64 %t1452, 0
  br i1 %t1453, label %then86, label %else86
then86:
  %t1454 = load i64, ptr %local.h.1336
  %t1455 = load i64, ptr %local.p.1337
  %t1456 = load i64, ptr %local.p.1337
  %t1457 = call i64 @"ln_f64"(i64 %t1456)
  %t1458 = call i64 @"sx_f64_mul"(i64 %t1455, i64 %t1457)
  %t1459 = call i64 @"sx_f64_sub"(i64 %t1454, i64 %t1458)
  store i64 %t1459, ptr %local.h.1336
  br label %then86_end
then86_end:
  br label %endif86
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t1460 = phi i64 [ 0, %then86_end ], [ 0, %else86_end ]
  %t1461 = load i64, ptr %local.a11
  %t1462 = call i64 @"abs_f64"(i64 %t1461)
  %t1463 = load i64, ptr %local.total.1335
  %t1464 = call i64 @"sx_f64_div"(i64 %t1462, i64 %t1463)
  store i64 %t1464, ptr %local.p.1337
  %t1465 = load i64, ptr %local.p.1337
  %t1466 = call i64 @f64_parse(ptr @.str.exp_s_entropy.165)
  %t1467 = call i64 @"sx_f64_gt"(i64 %t1465, i64 %t1466)
  %t1468 = icmp ne i64 %t1467, 0
  br i1 %t1468, label %then87, label %else87
then87:
  %t1469 = load i64, ptr %local.h.1336
  %t1470 = load i64, ptr %local.p.1337
  %t1471 = load i64, ptr %local.p.1337
  %t1472 = call i64 @"ln_f64"(i64 %t1471)
  %t1473 = call i64 @"sx_f64_mul"(i64 %t1470, i64 %t1472)
  %t1474 = call i64 @"sx_f64_sub"(i64 %t1469, i64 %t1473)
  store i64 %t1474, ptr %local.h.1336
  br label %then87_end
then87_end:
  br label %endif87
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t1475 = phi i64 [ 0, %then87_end ], [ 0, %else87_end ]
  %t1476 = load i64, ptr %local.a12
  %t1477 = call i64 @"abs_f64"(i64 %t1476)
  %t1478 = load i64, ptr %local.total.1335
  %t1479 = call i64 @"sx_f64_div"(i64 %t1477, i64 %t1478)
  store i64 %t1479, ptr %local.p.1337
  %t1480 = load i64, ptr %local.p.1337
  %t1481 = call i64 @f64_parse(ptr @.str.exp_s_entropy.166)
  %t1482 = call i64 @"sx_f64_gt"(i64 %t1480, i64 %t1481)
  %t1483 = icmp ne i64 %t1482, 0
  br i1 %t1483, label %then88, label %else88
then88:
  %t1484 = load i64, ptr %local.h.1336
  %t1485 = load i64, ptr %local.p.1337
  %t1486 = load i64, ptr %local.p.1337
  %t1487 = call i64 @"ln_f64"(i64 %t1486)
  %t1488 = call i64 @"sx_f64_mul"(i64 %t1485, i64 %t1487)
  %t1489 = call i64 @"sx_f64_sub"(i64 %t1484, i64 %t1488)
  store i64 %t1489, ptr %local.h.1336
  br label %then88_end
then88_end:
  br label %endif88
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t1490 = phi i64 [ 0, %then88_end ], [ 0, %else88_end ]
  %t1491 = load i64, ptr %local.a13
  %t1492 = call i64 @"abs_f64"(i64 %t1491)
  %t1493 = load i64, ptr %local.total.1335
  %t1494 = call i64 @"sx_f64_div"(i64 %t1492, i64 %t1493)
  store i64 %t1494, ptr %local.p.1337
  %t1495 = load i64, ptr %local.p.1337
  %t1496 = call i64 @f64_parse(ptr @.str.exp_s_entropy.167)
  %t1497 = call i64 @"sx_f64_gt"(i64 %t1495, i64 %t1496)
  %t1498 = icmp ne i64 %t1497, 0
  br i1 %t1498, label %then89, label %else89
then89:
  %t1499 = load i64, ptr %local.h.1336
  %t1500 = load i64, ptr %local.p.1337
  %t1501 = load i64, ptr %local.p.1337
  %t1502 = call i64 @"ln_f64"(i64 %t1501)
  %t1503 = call i64 @"sx_f64_mul"(i64 %t1500, i64 %t1502)
  %t1504 = call i64 @"sx_f64_sub"(i64 %t1499, i64 %t1503)
  store i64 %t1504, ptr %local.h.1336
  br label %then89_end
then89_end:
  br label %endif89
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t1505 = phi i64 [ 0, %then89_end ], [ 0, %else89_end ]
  %t1506 = load i64, ptr %local.a20
  %t1507 = call i64 @"abs_f64"(i64 %t1506)
  %t1508 = load i64, ptr %local.total.1335
  %t1509 = call i64 @"sx_f64_div"(i64 %t1507, i64 %t1508)
  store i64 %t1509, ptr %local.p.1337
  %t1510 = load i64, ptr %local.p.1337
  %t1511 = call i64 @f64_parse(ptr @.str.exp_s_entropy.168)
  %t1512 = call i64 @"sx_f64_gt"(i64 %t1510, i64 %t1511)
  %t1513 = icmp ne i64 %t1512, 0
  br i1 %t1513, label %then90, label %else90
then90:
  %t1514 = load i64, ptr %local.h.1336
  %t1515 = load i64, ptr %local.p.1337
  %t1516 = load i64, ptr %local.p.1337
  %t1517 = call i64 @"ln_f64"(i64 %t1516)
  %t1518 = call i64 @"sx_f64_mul"(i64 %t1515, i64 %t1517)
  %t1519 = call i64 @"sx_f64_sub"(i64 %t1514, i64 %t1518)
  store i64 %t1519, ptr %local.h.1336
  br label %then90_end
then90_end:
  br label %endif90
else90:
  br label %else90_end
else90_end:
  br label %endif90
endif90:
  %t1520 = phi i64 [ 0, %then90_end ], [ 0, %else90_end ]
  %t1521 = load i64, ptr %local.a21
  %t1522 = call i64 @"abs_f64"(i64 %t1521)
  %t1523 = load i64, ptr %local.total.1335
  %t1524 = call i64 @"sx_f64_div"(i64 %t1522, i64 %t1523)
  store i64 %t1524, ptr %local.p.1337
  %t1525 = load i64, ptr %local.p.1337
  %t1526 = call i64 @f64_parse(ptr @.str.exp_s_entropy.169)
  %t1527 = call i64 @"sx_f64_gt"(i64 %t1525, i64 %t1526)
  %t1528 = icmp ne i64 %t1527, 0
  br i1 %t1528, label %then91, label %else91
then91:
  %t1529 = load i64, ptr %local.h.1336
  %t1530 = load i64, ptr %local.p.1337
  %t1531 = load i64, ptr %local.p.1337
  %t1532 = call i64 @"ln_f64"(i64 %t1531)
  %t1533 = call i64 @"sx_f64_mul"(i64 %t1530, i64 %t1532)
  %t1534 = call i64 @"sx_f64_sub"(i64 %t1529, i64 %t1533)
  store i64 %t1534, ptr %local.h.1336
  br label %then91_end
then91_end:
  br label %endif91
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t1535 = phi i64 [ 0, %then91_end ], [ 0, %else91_end ]
  %t1536 = load i64, ptr %local.a22
  %t1537 = call i64 @"abs_f64"(i64 %t1536)
  %t1538 = load i64, ptr %local.total.1335
  %t1539 = call i64 @"sx_f64_div"(i64 %t1537, i64 %t1538)
  store i64 %t1539, ptr %local.p.1337
  %t1540 = load i64, ptr %local.p.1337
  %t1541 = call i64 @f64_parse(ptr @.str.exp_s_entropy.170)
  %t1542 = call i64 @"sx_f64_gt"(i64 %t1540, i64 %t1541)
  %t1543 = icmp ne i64 %t1542, 0
  br i1 %t1543, label %then92, label %else92
then92:
  %t1544 = load i64, ptr %local.h.1336
  %t1545 = load i64, ptr %local.p.1337
  %t1546 = load i64, ptr %local.p.1337
  %t1547 = call i64 @"ln_f64"(i64 %t1546)
  %t1548 = call i64 @"sx_f64_mul"(i64 %t1545, i64 %t1547)
  %t1549 = call i64 @"sx_f64_sub"(i64 %t1544, i64 %t1548)
  store i64 %t1549, ptr %local.h.1336
  br label %then92_end
then92_end:
  br label %endif92
else92:
  br label %else92_end
else92_end:
  br label %endif92
endif92:
  %t1550 = phi i64 [ 0, %then92_end ], [ 0, %else92_end ]
  %t1551 = load i64, ptr %local.a23
  %t1552 = call i64 @"abs_f64"(i64 %t1551)
  %t1553 = load i64, ptr %local.total.1335
  %t1554 = call i64 @"sx_f64_div"(i64 %t1552, i64 %t1553)
  store i64 %t1554, ptr %local.p.1337
  %t1555 = load i64, ptr %local.p.1337
  %t1556 = call i64 @f64_parse(ptr @.str.exp_s_entropy.171)
  %t1557 = call i64 @"sx_f64_gt"(i64 %t1555, i64 %t1556)
  %t1558 = icmp ne i64 %t1557, 0
  br i1 %t1558, label %then93, label %else93
then93:
  %t1559 = load i64, ptr %local.h.1336
  %t1560 = load i64, ptr %local.p.1337
  %t1561 = load i64, ptr %local.p.1337
  %t1562 = call i64 @"ln_f64"(i64 %t1561)
  %t1563 = call i64 @"sx_f64_mul"(i64 %t1560, i64 %t1562)
  %t1564 = call i64 @"sx_f64_sub"(i64 %t1559, i64 %t1563)
  store i64 %t1564, ptr %local.h.1336
  br label %then93_end
then93_end:
  br label %endif93
else93:
  br label %else93_end
else93_end:
  br label %endif93
endif93:
  %t1565 = phi i64 [ 0, %then93_end ], [ 0, %else93_end ]
  %t1566 = load i64, ptr %local.h.1336
  ret i64 %t1566
}

define i64 @"compute_loss"(i64 %p0, i64 %p1, i64 %p2, i64 %p3, i64 %t0, i64 %t1, i64 %t2, i64 %t3) nounwind {
entry:
  %local.d0.1567 = alloca i64
  %local.d1.1568 = alloca i64
  %local.d2.1569 = alloca i64
  %local.d3.1570 = alloca i64
  %local.p0 = alloca i64
  store i64 %p0, ptr %local.p0
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %local.p3 = alloca i64
  store i64 %p3, ptr %local.p3
  %local.t0 = alloca i64
  store i64 %t0, ptr %local.t0
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %t1571 = load i64, ptr %local.p0
  %t1572 = load i64, ptr %local.t0
  %t1573 = call i64 @"sx_f64_sub"(i64 %t1571, i64 %t1572)
  store i64 %t1573, ptr %local.d0.1567
  %t1574 = load i64, ptr %local.p1
  %t1575 = load i64, ptr %local.t1
  %t1576 = call i64 @"sx_f64_sub"(i64 %t1574, i64 %t1575)
  store i64 %t1576, ptr %local.d1.1568
  %t1577 = load i64, ptr %local.p2
  %t1578 = load i64, ptr %local.t2
  %t1579 = call i64 @"sx_f64_sub"(i64 %t1577, i64 %t1578)
  store i64 %t1579, ptr %local.d2.1569
  %t1580 = load i64, ptr %local.p3
  %t1581 = load i64, ptr %local.t3
  %t1582 = call i64 @"sx_f64_sub"(i64 %t1580, i64 %t1581)
  store i64 %t1582, ptr %local.d3.1570
  %t1583 = load i64, ptr %local.d0.1567
  %t1584 = load i64, ptr %local.d0.1567
  %t1585 = call i64 @"sx_f64_mul"(i64 %t1583, i64 %t1584)
  %t1586 = load i64, ptr %local.d1.1568
  %t1587 = load i64, ptr %local.d1.1568
  %t1588 = call i64 @"sx_f64_mul"(i64 %t1586, i64 %t1587)
  %t1589 = call i64 @"sx_f64_add"(i64 %t1585, i64 %t1588)
  %t1590 = load i64, ptr %local.d2.1569
  %t1591 = load i64, ptr %local.d2.1569
  %t1592 = call i64 @"sx_f64_mul"(i64 %t1590, i64 %t1591)
  %t1593 = call i64 @"sx_f64_add"(i64 %t1589, i64 %t1592)
  %t1594 = load i64, ptr %local.d3.1570
  %t1595 = load i64, ptr %local.d3.1570
  %t1596 = call i64 @"sx_f64_mul"(i64 %t1594, i64 %t1595)
  %t1597 = call i64 @"sx_f64_add"(i64 %t1593, i64 %t1596)
  ret i64 %t1597
}

define i64 @"test_matrix_entropy"() nounwind {
entry:
  %local.a00.1598 = alloca i64
  %local.a01.1599 = alloca i64
  %local.a02.1600 = alloca i64
  %local.a03.1601 = alloca i64
  %local.a10.1602 = alloca i64
  %local.a11.1603 = alloca i64
  %local.a12.1604 = alloca i64
  %local.a13.1605 = alloca i64
  %local.a20.1606 = alloca i64
  %local.a21.1607 = alloca i64
  %local.a22.1608 = alloca i64
  %local.a23.1609 = alloca i64
  %local.p0.1610 = alloca i64
  %local.p1.1611 = alloca i64
  %local.p2.1612 = alloca i64
  %local.p3.1613 = alloca i64
  %local.t0_0.1614 = alloca i64
  %local.t0_1.1615 = alloca i64
  %local.t0_2.1616 = alloca i64
  %local.t0_3.1617 = alloca i64
  %local.t1_0.1618 = alloca i64
  %local.t1_1.1619 = alloca i64
  %local.t1_2.1620 = alloca i64
  %local.t1_3.1621 = alloca i64
  %local.t2_0.1622 = alloca i64
  %local.t2_1.1623 = alloca i64
  %local.t2_2.1624 = alloca i64
  %local.t2_3.1625 = alloca i64
  %local.lr.1626 = alloca i64
  %local.cycle.1627 = alloca i64
  %local.prev_total.1628 = alloca i64
  %local.early_drift.1629 = alloca i64
  %local.late_drift.1630 = alloca i64
  %local.count_e.1631 = alloca i64
  %local.count_l.1632 = alloca i64
  %local.sum_h.1633 = alloca i64
  %local.sum_sl.1634 = alloca i64
  %local.sum_h2.1635 = alloca i64
  %local.sum_sl2.1636 = alloca i64
  %local.sum_hsl.1637 = alloca i64
  %local.n_corr.1638 = alloca i64
  %local.l0.1639 = alloca i64
  %local.l1.1640 = alloca i64
  %local.l2.1641 = alloca i64
  %local.total_loss.1642 = alloca i64
  %local.g0.1643 = alloca i64
  %local.g1.1644 = alloca i64
  %local.g2.1645 = alloca i64
  %local.g3.1646 = alloca i64
  %local.eta.1647 = alloca i64
  %local.loss_delta.1648 = alloca i64
  %local.hm.1649 = alloca i64
  %local.drift.1650 = alloca i64
  %local.s_local.1651 = alloca i64
  %local.avg_e.1652 = alloca i64
  %local.s_final.1653 = alloca i64
  %local.avg_e.1654 = alloca i64
  %local.avg_l.1655 = alloca i64
  %local.nf.1656 = alloca i64
  %local.num.1657 = alloca i64
  %local.da.1658 = alloca i64
  %local.db.1659 = alloca i64
  %local.corr.1660 = alloca i64
  %t1661 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.172)
  %t1662 = ptrtoint ptr %t1661 to i64
  %t1663 = inttoptr i64 %t1662 to ptr
  call void @intrinsic_println(ptr %t1663)
  %t1664 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.173)
  %t1665 = ptrtoint ptr %t1664 to i64
  %t1666 = inttoptr i64 %t1665 to ptr
  call void @intrinsic_println(ptr %t1666)
  %t1667 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.174)
  %t1668 = ptrtoint ptr %t1667 to i64
  %t1669 = inttoptr i64 %t1668 to ptr
  call void @intrinsic_println(ptr %t1669)
  %t1670 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.175)
  %t1671 = ptrtoint ptr %t1670 to i64
  %t1672 = inttoptr i64 %t1671 to ptr
  call void @intrinsic_println(ptr %t1672)
  %t1673 = call i64 @f64_parse(ptr @.str.exp_s_entropy.176)
  store i64 %t1673, ptr %local.a00.1598
  %t1674 = call i64 @f64_parse(ptr @.str.exp_s_entropy.177)
  store i64 %t1674, ptr %local.a01.1599
  %t1675 = call i64 @f64_parse(ptr @.str.exp_s_entropy.178)
  store i64 %t1675, ptr %local.a02.1600
  %t1676 = call i64 @f64_parse(ptr @.str.exp_s_entropy.179)
  store i64 %t1676, ptr %local.a03.1601
  %t1677 = call i64 @f64_parse(ptr @.str.exp_s_entropy.180)
  store i64 %t1677, ptr %local.a10.1602
  %t1678 = call i64 @f64_parse(ptr @.str.exp_s_entropy.181)
  store i64 %t1678, ptr %local.a11.1603
  %t1679 = call i64 @f64_parse(ptr @.str.exp_s_entropy.182)
  store i64 %t1679, ptr %local.a12.1604
  %t1680 = call i64 @f64_parse(ptr @.str.exp_s_entropy.183)
  store i64 %t1680, ptr %local.a13.1605
  %t1681 = call i64 @f64_parse(ptr @.str.exp_s_entropy.184)
  store i64 %t1681, ptr %local.a20.1606
  %t1682 = call i64 @f64_parse(ptr @.str.exp_s_entropy.185)
  store i64 %t1682, ptr %local.a21.1607
  %t1683 = call i64 @f64_parse(ptr @.str.exp_s_entropy.186)
  store i64 %t1683, ptr %local.a22.1608
  %t1684 = call i64 @f64_parse(ptr @.str.exp_s_entropy.187)
  store i64 %t1684, ptr %local.a23.1609
  %t1685 = call i64 @f64_parse(ptr @.str.exp_s_entropy.188)
  store i64 %t1685, ptr %local.p0.1610
  %t1686 = call i64 @f64_parse(ptr @.str.exp_s_entropy.189)
  store i64 %t1686, ptr %local.p1.1611
  %t1687 = call i64 @f64_parse(ptr @.str.exp_s_entropy.190)
  store i64 %t1687, ptr %local.p2.1612
  %t1688 = call i64 @f64_parse(ptr @.str.exp_s_entropy.191)
  store i64 %t1688, ptr %local.p3.1613
  %t1689 = call i64 @f64_parse(ptr @.str.exp_s_entropy.192)
  store i64 %t1689, ptr %local.t0_0.1614
  %t1690 = call i64 @f64_parse(ptr @.str.exp_s_entropy.193)
  store i64 %t1690, ptr %local.t0_1.1615
  %t1691 = call i64 @f64_parse(ptr @.str.exp_s_entropy.194)
  store i64 %t1691, ptr %local.t0_2.1616
  %t1692 = call i64 @f64_parse(ptr @.str.exp_s_entropy.195)
  store i64 %t1692, ptr %local.t0_3.1617
  %t1693 = call i64 @f64_parse(ptr @.str.exp_s_entropy.196)
  store i64 %t1693, ptr %local.t1_0.1618
  %t1694 = call i64 @f64_parse(ptr @.str.exp_s_entropy.197)
  store i64 %t1694, ptr %local.t1_1.1619
  %t1695 = call i64 @f64_parse(ptr @.str.exp_s_entropy.198)
  store i64 %t1695, ptr %local.t1_2.1620
  %t1696 = call i64 @f64_parse(ptr @.str.exp_s_entropy.199)
  store i64 %t1696, ptr %local.t1_3.1621
  %t1697 = call i64 @f64_parse(ptr @.str.exp_s_entropy.200)
  store i64 %t1697, ptr %local.t2_0.1622
  %t1698 = call i64 @f64_parse(ptr @.str.exp_s_entropy.201)
  store i64 %t1698, ptr %local.t2_1.1623
  %t1699 = call i64 @f64_parse(ptr @.str.exp_s_entropy.202)
  store i64 %t1699, ptr %local.t2_2.1624
  %t1700 = call i64 @f64_parse(ptr @.str.exp_s_entropy.203)
  store i64 %t1700, ptr %local.t2_3.1625
  %t1701 = call i64 @f64_parse(ptr @.str.exp_s_entropy.204)
  store i64 %t1701, ptr %local.lr.1626
  store i64 0, ptr %local.cycle.1627
  %t1702 = call i64 @f64_parse(ptr @.str.exp_s_entropy.205)
  store i64 %t1702, ptr %local.prev_total.1628
  %t1703 = call i64 @f64_parse(ptr @.str.exp_s_entropy.206)
  store i64 %t1703, ptr %local.early_drift.1629
  %t1704 = call i64 @f64_parse(ptr @.str.exp_s_entropy.207)
  store i64 %t1704, ptr %local.late_drift.1630
  store i64 0, ptr %local.count_e.1631
  store i64 0, ptr %local.count_l.1632
  %t1705 = call i64 @f64_parse(ptr @.str.exp_s_entropy.208)
  store i64 %t1705, ptr %local.sum_h.1633
  %t1706 = call i64 @f64_parse(ptr @.str.exp_s_entropy.209)
  store i64 %t1706, ptr %local.sum_sl.1634
  %t1707 = call i64 @f64_parse(ptr @.str.exp_s_entropy.210)
  store i64 %t1707, ptr %local.sum_h2.1635
  %t1708 = call i64 @f64_parse(ptr @.str.exp_s_entropy.211)
  store i64 %t1708, ptr %local.sum_sl2.1636
  %t1709 = call i64 @f64_parse(ptr @.str.exp_s_entropy.212)
  store i64 %t1709, ptr %local.sum_hsl.1637
  store i64 0, ptr %local.n_corr.1638
  %t1710 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.213)
  %t1711 = ptrtoint ptr %t1710 to i64
  %t1712 = inttoptr i64 %t1711 to ptr
  call void @intrinsic_println(ptr %t1712)
  br label %loop94
loop94:
  %t1713 = load i64, ptr %local.cycle.1627
  %t1714 = icmp slt i64 %t1713, 60
  %t1715 = zext i1 %t1714 to i64
  %t1716 = icmp ne i64 %t1715, 0
  br i1 %t1716, label %body94, label %endloop94
body94:
  %t1717 = load i64, ptr %local.p0.1610
  %t1718 = load i64, ptr %local.p1.1611
  %t1719 = load i64, ptr %local.p2.1612
  %t1720 = load i64, ptr %local.p3.1613
  %t1721 = load i64, ptr %local.t0_0.1614
  %t1722 = load i64, ptr %local.t0_1.1615
  %t1723 = load i64, ptr %local.t0_2.1616
  %t1724 = load i64, ptr %local.t0_3.1617
  %t1725 = call i64 @"compute_loss"(i64 %t1717, i64 %t1718, i64 %t1719, i64 %t1720, i64 %t1721, i64 %t1722, i64 %t1723, i64 %t1724)
  store i64 %t1725, ptr %local.l0.1639
  %t1726 = load i64, ptr %local.p0.1610
  %t1727 = load i64, ptr %local.p1.1611
  %t1728 = load i64, ptr %local.p2.1612
  %t1729 = load i64, ptr %local.p3.1613
  %t1730 = load i64, ptr %local.t1_0.1618
  %t1731 = load i64, ptr %local.t1_1.1619
  %t1732 = load i64, ptr %local.t1_2.1620
  %t1733 = load i64, ptr %local.t1_3.1621
  %t1734 = call i64 @"compute_loss"(i64 %t1726, i64 %t1727, i64 %t1728, i64 %t1729, i64 %t1730, i64 %t1731, i64 %t1732, i64 %t1733)
  store i64 %t1734, ptr %local.l1.1640
  %t1735 = load i64, ptr %local.p0.1610
  %t1736 = load i64, ptr %local.p1.1611
  %t1737 = load i64, ptr %local.p2.1612
  %t1738 = load i64, ptr %local.p3.1613
  %t1739 = load i64, ptr %local.t2_0.1622
  %t1740 = load i64, ptr %local.t2_1.1623
  %t1741 = load i64, ptr %local.t2_2.1624
  %t1742 = load i64, ptr %local.t2_3.1625
  %t1743 = call i64 @"compute_loss"(i64 %t1735, i64 %t1736, i64 %t1737, i64 %t1738, i64 %t1739, i64 %t1740, i64 %t1741, i64 %t1742)
  store i64 %t1743, ptr %local.l2.1641
  %t1744 = load i64, ptr %local.l0.1639
  %t1745 = load i64, ptr %local.l1.1640
  %t1746 = call i64 @"sx_f64_add"(i64 %t1744, i64 %t1745)
  %t1747 = load i64, ptr %local.l2.1641
  %t1748 = call i64 @"sx_f64_add"(i64 %t1746, i64 %t1747)
  store i64 %t1748, ptr %local.total_loss.1642
  %t1749 = load i64, ptr %local.a00.1598
  %t1750 = call i64 @f64_parse(ptr @.str.exp_s_entropy.214)
  %t1751 = call i64 @"sx_f64_mul"(i64 %t1749, i64 %t1750)
  %t1752 = load i64, ptr %local.p0.1610
  %t1753 = load i64, ptr %local.t0_0.1614
  %t1754 = call i64 @"sx_f64_sub"(i64 %t1752, i64 %t1753)
  %t1755 = call i64 @"sx_f64_mul"(i64 %t1751, i64 %t1754)
  %t1756 = load i64, ptr %local.a10.1602
  %t1757 = call i64 @f64_parse(ptr @.str.exp_s_entropy.215)
  %t1758 = call i64 @"sx_f64_mul"(i64 %t1756, i64 %t1757)
  %t1759 = load i64, ptr %local.p0.1610
  %t1760 = load i64, ptr %local.t1_0.1618
  %t1761 = call i64 @"sx_f64_sub"(i64 %t1759, i64 %t1760)
  %t1762 = call i64 @"sx_f64_mul"(i64 %t1758, i64 %t1761)
  %t1763 = call i64 @"sx_f64_add"(i64 %t1755, i64 %t1762)
  %t1764 = load i64, ptr %local.a20.1606
  %t1765 = call i64 @f64_parse(ptr @.str.exp_s_entropy.216)
  %t1766 = call i64 @"sx_f64_mul"(i64 %t1764, i64 %t1765)
  %t1767 = load i64, ptr %local.p0.1610
  %t1768 = load i64, ptr %local.t2_0.1622
  %t1769 = call i64 @"sx_f64_sub"(i64 %t1767, i64 %t1768)
  %t1770 = call i64 @"sx_f64_mul"(i64 %t1766, i64 %t1769)
  %t1771 = call i64 @"sx_f64_add"(i64 %t1763, i64 %t1770)
  store i64 %t1771, ptr %local.g0.1643
  %t1772 = load i64, ptr %local.a01.1599
  %t1773 = call i64 @f64_parse(ptr @.str.exp_s_entropy.217)
  %t1774 = call i64 @"sx_f64_mul"(i64 %t1772, i64 %t1773)
  %t1775 = load i64, ptr %local.p1.1611
  %t1776 = load i64, ptr %local.t0_1.1615
  %t1777 = call i64 @"sx_f64_sub"(i64 %t1775, i64 %t1776)
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1774, i64 %t1777)
  %t1779 = load i64, ptr %local.a11.1603
  %t1780 = call i64 @f64_parse(ptr @.str.exp_s_entropy.218)
  %t1781 = call i64 @"sx_f64_mul"(i64 %t1779, i64 %t1780)
  %t1782 = load i64, ptr %local.p1.1611
  %t1783 = load i64, ptr %local.t1_1.1619
  %t1784 = call i64 @"sx_f64_sub"(i64 %t1782, i64 %t1783)
  %t1785 = call i64 @"sx_f64_mul"(i64 %t1781, i64 %t1784)
  %t1786 = call i64 @"sx_f64_add"(i64 %t1778, i64 %t1785)
  %t1787 = load i64, ptr %local.a21.1607
  %t1788 = call i64 @f64_parse(ptr @.str.exp_s_entropy.219)
  %t1789 = call i64 @"sx_f64_mul"(i64 %t1787, i64 %t1788)
  %t1790 = load i64, ptr %local.p1.1611
  %t1791 = load i64, ptr %local.t2_1.1623
  %t1792 = call i64 @"sx_f64_sub"(i64 %t1790, i64 %t1791)
  %t1793 = call i64 @"sx_f64_mul"(i64 %t1789, i64 %t1792)
  %t1794 = call i64 @"sx_f64_add"(i64 %t1786, i64 %t1793)
  store i64 %t1794, ptr %local.g1.1644
  %t1795 = load i64, ptr %local.a02.1600
  %t1796 = call i64 @f64_parse(ptr @.str.exp_s_entropy.220)
  %t1797 = call i64 @"sx_f64_mul"(i64 %t1795, i64 %t1796)
  %t1798 = load i64, ptr %local.p2.1612
  %t1799 = load i64, ptr %local.t0_2.1616
  %t1800 = call i64 @"sx_f64_sub"(i64 %t1798, i64 %t1799)
  %t1801 = call i64 @"sx_f64_mul"(i64 %t1797, i64 %t1800)
  %t1802 = load i64, ptr %local.a12.1604
  %t1803 = call i64 @f64_parse(ptr @.str.exp_s_entropy.221)
  %t1804 = call i64 @"sx_f64_mul"(i64 %t1802, i64 %t1803)
  %t1805 = load i64, ptr %local.p2.1612
  %t1806 = load i64, ptr %local.t1_2.1620
  %t1807 = call i64 @"sx_f64_sub"(i64 %t1805, i64 %t1806)
  %t1808 = call i64 @"sx_f64_mul"(i64 %t1804, i64 %t1807)
  %t1809 = call i64 @"sx_f64_add"(i64 %t1801, i64 %t1808)
  %t1810 = load i64, ptr %local.a22.1608
  %t1811 = call i64 @f64_parse(ptr @.str.exp_s_entropy.222)
  %t1812 = call i64 @"sx_f64_mul"(i64 %t1810, i64 %t1811)
  %t1813 = load i64, ptr %local.p2.1612
  %t1814 = load i64, ptr %local.t2_2.1624
  %t1815 = call i64 @"sx_f64_sub"(i64 %t1813, i64 %t1814)
  %t1816 = call i64 @"sx_f64_mul"(i64 %t1812, i64 %t1815)
  %t1817 = call i64 @"sx_f64_add"(i64 %t1809, i64 %t1816)
  store i64 %t1817, ptr %local.g2.1645
  %t1818 = load i64, ptr %local.a03.1601
  %t1819 = call i64 @f64_parse(ptr @.str.exp_s_entropy.223)
  %t1820 = call i64 @"sx_f64_mul"(i64 %t1818, i64 %t1819)
  %t1821 = load i64, ptr %local.p3.1613
  %t1822 = load i64, ptr %local.t0_3.1617
  %t1823 = call i64 @"sx_f64_sub"(i64 %t1821, i64 %t1822)
  %t1824 = call i64 @"sx_f64_mul"(i64 %t1820, i64 %t1823)
  %t1825 = load i64, ptr %local.a13.1605
  %t1826 = call i64 @f64_parse(ptr @.str.exp_s_entropy.224)
  %t1827 = call i64 @"sx_f64_mul"(i64 %t1825, i64 %t1826)
  %t1828 = load i64, ptr %local.p3.1613
  %t1829 = load i64, ptr %local.t1_3.1621
  %t1830 = call i64 @"sx_f64_sub"(i64 %t1828, i64 %t1829)
  %t1831 = call i64 @"sx_f64_mul"(i64 %t1827, i64 %t1830)
  %t1832 = call i64 @"sx_f64_add"(i64 %t1824, i64 %t1831)
  %t1833 = load i64, ptr %local.a23.1609
  %t1834 = call i64 @f64_parse(ptr @.str.exp_s_entropy.225)
  %t1835 = call i64 @"sx_f64_mul"(i64 %t1833, i64 %t1834)
  %t1836 = load i64, ptr %local.p3.1613
  %t1837 = load i64, ptr %local.t2_3.1625
  %t1838 = call i64 @"sx_f64_sub"(i64 %t1836, i64 %t1837)
  %t1839 = call i64 @"sx_f64_mul"(i64 %t1835, i64 %t1838)
  %t1840 = call i64 @"sx_f64_add"(i64 %t1832, i64 %t1839)
  store i64 %t1840, ptr %local.g3.1646
  %t1841 = load i64, ptr %local.p0.1610
  %t1842 = load i64, ptr %local.lr.1626
  %t1843 = load i64, ptr %local.g0.1643
  %t1844 = call i64 @"sx_f64_mul"(i64 %t1842, i64 %t1843)
  %t1845 = call i64 @"sx_f64_sub"(i64 %t1841, i64 %t1844)
  store i64 %t1845, ptr %local.p0.1610
  %t1846 = load i64, ptr %local.p1.1611
  %t1847 = load i64, ptr %local.lr.1626
  %t1848 = load i64, ptr %local.g1.1644
  %t1849 = call i64 @"sx_f64_mul"(i64 %t1847, i64 %t1848)
  %t1850 = call i64 @"sx_f64_sub"(i64 %t1846, i64 %t1849)
  store i64 %t1850, ptr %local.p1.1611
  %t1851 = load i64, ptr %local.p2.1612
  %t1852 = load i64, ptr %local.lr.1626
  %t1853 = load i64, ptr %local.g2.1645
  %t1854 = call i64 @"sx_f64_mul"(i64 %t1852, i64 %t1853)
  %t1855 = call i64 @"sx_f64_sub"(i64 %t1851, i64 %t1854)
  store i64 %t1855, ptr %local.p2.1612
  %t1856 = load i64, ptr %local.p3.1613
  %t1857 = load i64, ptr %local.lr.1626
  %t1858 = load i64, ptr %local.g3.1646
  %t1859 = call i64 @"sx_f64_mul"(i64 %t1857, i64 %t1858)
  %t1860 = call i64 @"sx_f64_sub"(i64 %t1856, i64 %t1859)
  store i64 %t1860, ptr %local.p3.1613
  %t1861 = call i64 @f64_parse(ptr @.str.exp_s_entropy.226)
  store i64 %t1861, ptr %local.eta.1647
  %t1862 = load i64, ptr %local.prev_total.1628
  %t1863 = load i64, ptr %local.total_loss.1642
  %t1864 = call i64 @"sx_f64_sub"(i64 %t1862, i64 %t1863)
  store i64 %t1864, ptr %local.loss_delta.1648
  %t1865 = load i64, ptr %local.a00.1598
  %t1866 = load i64, ptr %local.eta.1647
  %t1867 = load i64, ptr %local.loss_delta.1648
  %t1868 = call i64 @"sx_f64_mul"(i64 %t1866, i64 %t1867)
  %t1869 = load i64, ptr %local.p0.1610
  %t1870 = load i64, ptr %local.t0_0.1614
  %t1871 = call i64 @"sx_f64_sub"(i64 %t1869, i64 %t1870)
  %t1872 = call i64 @"abs_f64"(i64 %t1871)
  %t1873 = call i64 @"sx_f64_mul"(i64 %t1868, i64 %t1872)
  %t1874 = call i64 @"sx_f64_add"(i64 %t1865, i64 %t1873)
  store i64 %t1874, ptr %local.a00.1598
  %t1875 = load i64, ptr %local.a01.1599
  %t1876 = load i64, ptr %local.eta.1647
  %t1877 = load i64, ptr %local.loss_delta.1648
  %t1878 = call i64 @"sx_f64_mul"(i64 %t1876, i64 %t1877)
  %t1879 = load i64, ptr %local.p1.1611
  %t1880 = load i64, ptr %local.t0_1.1615
  %t1881 = call i64 @"sx_f64_sub"(i64 %t1879, i64 %t1880)
  %t1882 = call i64 @"abs_f64"(i64 %t1881)
  %t1883 = call i64 @"sx_f64_mul"(i64 %t1878, i64 %t1882)
  %t1884 = call i64 @"sx_f64_add"(i64 %t1875, i64 %t1883)
  store i64 %t1884, ptr %local.a01.1599
  %t1885 = load i64, ptr %local.a02.1600
  %t1886 = load i64, ptr %local.eta.1647
  %t1887 = load i64, ptr %local.loss_delta.1648
  %t1888 = call i64 @"sx_f64_mul"(i64 %t1886, i64 %t1887)
  %t1889 = load i64, ptr %local.p2.1612
  %t1890 = load i64, ptr %local.t0_2.1616
  %t1891 = call i64 @"sx_f64_sub"(i64 %t1889, i64 %t1890)
  %t1892 = call i64 @"abs_f64"(i64 %t1891)
  %t1893 = call i64 @"sx_f64_mul"(i64 %t1888, i64 %t1892)
  %t1894 = call i64 @"sx_f64_add"(i64 %t1885, i64 %t1893)
  store i64 %t1894, ptr %local.a02.1600
  %t1895 = load i64, ptr %local.a03.1601
  %t1896 = load i64, ptr %local.eta.1647
  %t1897 = load i64, ptr %local.loss_delta.1648
  %t1898 = call i64 @"sx_f64_mul"(i64 %t1896, i64 %t1897)
  %t1899 = load i64, ptr %local.p3.1613
  %t1900 = load i64, ptr %local.t0_3.1617
  %t1901 = call i64 @"sx_f64_sub"(i64 %t1899, i64 %t1900)
  %t1902 = call i64 @"abs_f64"(i64 %t1901)
  %t1903 = call i64 @"sx_f64_mul"(i64 %t1898, i64 %t1902)
  %t1904 = call i64 @"sx_f64_add"(i64 %t1895, i64 %t1903)
  store i64 %t1904, ptr %local.a03.1601
  %t1905 = load i64, ptr %local.a10.1602
  %t1906 = load i64, ptr %local.eta.1647
  %t1907 = load i64, ptr %local.loss_delta.1648
  %t1908 = call i64 @"sx_f64_mul"(i64 %t1906, i64 %t1907)
  %t1909 = load i64, ptr %local.p0.1610
  %t1910 = load i64, ptr %local.t1_0.1618
  %t1911 = call i64 @"sx_f64_sub"(i64 %t1909, i64 %t1910)
  %t1912 = call i64 @"abs_f64"(i64 %t1911)
  %t1913 = call i64 @"sx_f64_mul"(i64 %t1908, i64 %t1912)
  %t1914 = call i64 @"sx_f64_add"(i64 %t1905, i64 %t1913)
  store i64 %t1914, ptr %local.a10.1602
  %t1915 = load i64, ptr %local.a11.1603
  %t1916 = load i64, ptr %local.eta.1647
  %t1917 = load i64, ptr %local.loss_delta.1648
  %t1918 = call i64 @"sx_f64_mul"(i64 %t1916, i64 %t1917)
  %t1919 = load i64, ptr %local.p1.1611
  %t1920 = load i64, ptr %local.t1_1.1619
  %t1921 = call i64 @"sx_f64_sub"(i64 %t1919, i64 %t1920)
  %t1922 = call i64 @"abs_f64"(i64 %t1921)
  %t1923 = call i64 @"sx_f64_mul"(i64 %t1918, i64 %t1922)
  %t1924 = call i64 @"sx_f64_add"(i64 %t1915, i64 %t1923)
  store i64 %t1924, ptr %local.a11.1603
  %t1925 = load i64, ptr %local.a12.1604
  %t1926 = load i64, ptr %local.eta.1647
  %t1927 = load i64, ptr %local.loss_delta.1648
  %t1928 = call i64 @"sx_f64_mul"(i64 %t1926, i64 %t1927)
  %t1929 = load i64, ptr %local.p2.1612
  %t1930 = load i64, ptr %local.t1_2.1620
  %t1931 = call i64 @"sx_f64_sub"(i64 %t1929, i64 %t1930)
  %t1932 = call i64 @"abs_f64"(i64 %t1931)
  %t1933 = call i64 @"sx_f64_mul"(i64 %t1928, i64 %t1932)
  %t1934 = call i64 @"sx_f64_add"(i64 %t1925, i64 %t1933)
  store i64 %t1934, ptr %local.a12.1604
  %t1935 = load i64, ptr %local.a13.1605
  %t1936 = load i64, ptr %local.eta.1647
  %t1937 = load i64, ptr %local.loss_delta.1648
  %t1938 = call i64 @"sx_f64_mul"(i64 %t1936, i64 %t1937)
  %t1939 = load i64, ptr %local.p3.1613
  %t1940 = load i64, ptr %local.t1_3.1621
  %t1941 = call i64 @"sx_f64_sub"(i64 %t1939, i64 %t1940)
  %t1942 = call i64 @"abs_f64"(i64 %t1941)
  %t1943 = call i64 @"sx_f64_mul"(i64 %t1938, i64 %t1942)
  %t1944 = call i64 @"sx_f64_add"(i64 %t1935, i64 %t1943)
  store i64 %t1944, ptr %local.a13.1605
  %t1945 = load i64, ptr %local.a20.1606
  %t1946 = load i64, ptr %local.eta.1647
  %t1947 = load i64, ptr %local.loss_delta.1648
  %t1948 = call i64 @"sx_f64_mul"(i64 %t1946, i64 %t1947)
  %t1949 = load i64, ptr %local.p0.1610
  %t1950 = load i64, ptr %local.t2_0.1622
  %t1951 = call i64 @"sx_f64_sub"(i64 %t1949, i64 %t1950)
  %t1952 = call i64 @"abs_f64"(i64 %t1951)
  %t1953 = call i64 @"sx_f64_mul"(i64 %t1948, i64 %t1952)
  %t1954 = call i64 @"sx_f64_add"(i64 %t1945, i64 %t1953)
  store i64 %t1954, ptr %local.a20.1606
  %t1955 = load i64, ptr %local.a21.1607
  %t1956 = load i64, ptr %local.eta.1647
  %t1957 = load i64, ptr %local.loss_delta.1648
  %t1958 = call i64 @"sx_f64_mul"(i64 %t1956, i64 %t1957)
  %t1959 = load i64, ptr %local.p1.1611
  %t1960 = load i64, ptr %local.t2_1.1623
  %t1961 = call i64 @"sx_f64_sub"(i64 %t1959, i64 %t1960)
  %t1962 = call i64 @"abs_f64"(i64 %t1961)
  %t1963 = call i64 @"sx_f64_mul"(i64 %t1958, i64 %t1962)
  %t1964 = call i64 @"sx_f64_add"(i64 %t1955, i64 %t1963)
  store i64 %t1964, ptr %local.a21.1607
  %t1965 = load i64, ptr %local.a22.1608
  %t1966 = load i64, ptr %local.eta.1647
  %t1967 = load i64, ptr %local.loss_delta.1648
  %t1968 = call i64 @"sx_f64_mul"(i64 %t1966, i64 %t1967)
  %t1969 = load i64, ptr %local.p2.1612
  %t1970 = load i64, ptr %local.t2_2.1624
  %t1971 = call i64 @"sx_f64_sub"(i64 %t1969, i64 %t1970)
  %t1972 = call i64 @"abs_f64"(i64 %t1971)
  %t1973 = call i64 @"sx_f64_mul"(i64 %t1968, i64 %t1972)
  %t1974 = call i64 @"sx_f64_add"(i64 %t1965, i64 %t1973)
  store i64 %t1974, ptr %local.a22.1608
  %t1975 = load i64, ptr %local.a23.1609
  %t1976 = load i64, ptr %local.eta.1647
  %t1977 = load i64, ptr %local.loss_delta.1648
  %t1978 = call i64 @"sx_f64_mul"(i64 %t1976, i64 %t1977)
  %t1979 = load i64, ptr %local.p3.1613
  %t1980 = load i64, ptr %local.t2_3.1625
  %t1981 = call i64 @"sx_f64_sub"(i64 %t1979, i64 %t1980)
  %t1982 = call i64 @"abs_f64"(i64 %t1981)
  %t1983 = call i64 @"sx_f64_mul"(i64 %t1978, i64 %t1982)
  %t1984 = call i64 @"sx_f64_add"(i64 %t1975, i64 %t1983)
  store i64 %t1984, ptr %local.a23.1609
  %t1985 = load i64, ptr %local.a00.1598
  %t1986 = load i64, ptr %local.a01.1599
  %t1987 = load i64, ptr %local.a02.1600
  %t1988 = load i64, ptr %local.a03.1601
  %t1989 = load i64, ptr %local.a10.1602
  %t1990 = load i64, ptr %local.a11.1603
  %t1991 = load i64, ptr %local.a12.1604
  %t1992 = load i64, ptr %local.a13.1605
  %t1993 = load i64, ptr %local.a20.1606
  %t1994 = load i64, ptr %local.a21.1607
  %t1995 = load i64, ptr %local.a22.1608
  %t1996 = load i64, ptr %local.a23.1609
  %t1997 = call i64 @"matrix_entropy_3x4"(i64 %t1985, i64 %t1986, i64 %t1987, i64 %t1988, i64 %t1989, i64 %t1990, i64 %t1991, i64 %t1992, i64 %t1993, i64 %t1994, i64 %t1995, i64 %t1996)
  store i64 %t1997, ptr %local.hm.1649
  %t1998 = load i64, ptr %local.total_loss.1642
  %t1999 = load i64, ptr %local.prev_total.1628
  %t2000 = call i64 @"sx_f64_sub"(i64 %t1998, i64 %t1999)
  %t2001 = call i64 @"abs_f64"(i64 %t2000)
  store i64 %t2001, ptr %local.drift.1650
  %t2002 = call i64 @f64_parse(ptr @.str.exp_s_entropy.227)
  store i64 %t2002, ptr %local.s_local.1651
  %t2003 = load i64, ptr %local.cycle.1627
  %t2004 = icmp slt i64 %t2003, 20
  %t2005 = zext i1 %t2004 to i64
  %t2006 = icmp ne i64 %t2005, 0
  br i1 %t2006, label %then95, label %else95
then95:
  %t2007 = load i64, ptr %local.early_drift.1629
  %t2008 = load i64, ptr %local.drift.1650
  %t2009 = call i64 @"sx_f64_add"(i64 %t2007, i64 %t2008)
  store i64 %t2009, ptr %local.early_drift.1629
  %t2010 = load i64, ptr %local.count_e.1631
  %t2011 = add i64 %t2010, 1
  store i64 %t2011, ptr %local.count_e.1631
  br label %then95_end
then95_end:
  br label %endif95
else95:
  br label %else95_end
else95_end:
  br label %endif95
endif95:
  %t2012 = phi i64 [ 0, %then95_end ], [ 0, %else95_end ]
  %t2013 = load i64, ptr %local.cycle.1627
  %t2014 = icmp sge i64 %t2013, 40
  %t2015 = zext i1 %t2014 to i64
  %t2016 = icmp ne i64 %t2015, 0
  br i1 %t2016, label %then96, label %else96
then96:
  %t2017 = load i64, ptr %local.late_drift.1630
  %t2018 = load i64, ptr %local.drift.1650
  %t2019 = call i64 @"sx_f64_add"(i64 %t2017, i64 %t2018)
  store i64 %t2019, ptr %local.late_drift.1630
  %t2020 = load i64, ptr %local.count_l.1632
  %t2021 = add i64 %t2020, 1
  store i64 %t2021, ptr %local.count_l.1632
  br label %then96_end
then96_end:
  br label %endif96
else96:
  br label %else96_end
else96_end:
  br label %endif96
endif96:
  %t2022 = phi i64 [ 0, %then96_end ], [ 0, %else96_end ]
  %t2023 = load i64, ptr %local.count_e.1631
  %t2024 = icmp sgt i64 %t2023, 0
  %t2025 = zext i1 %t2024 to i64
  %t2026 = icmp ne i64 %t2025, 0
  br i1 %t2026, label %then97, label %else97
then97:
  %t2027 = load i64, ptr %local.early_drift.1629
  %t2028 = load i64, ptr %local.count_e.1631
  %t2029 = call i64 @"sx_int_to_f64"(i64 %t2028)
  %t2030 = call i64 @"sx_f64_div"(i64 %t2027, i64 %t2029)
  store i64 %t2030, ptr %local.avg_e.1652
  %t2031 = load i64, ptr %local.avg_e.1652
  %t2032 = call i64 @f64_parse(ptr @.str.exp_s_entropy.228)
  %t2033 = call i64 @"sx_f64_gt"(i64 %t2031, i64 %t2032)
  %t2034 = icmp ne i64 %t2033, 0
  br i1 %t2034, label %then98, label %else98
then98:
  %t2035 = call i64 @f64_parse(ptr @.str.exp_s_entropy.229)
  %t2036 = load i64, ptr %local.drift.1650
  %t2037 = load i64, ptr %local.avg_e.1652
  %t2038 = call i64 @"sx_f64_div"(i64 %t2036, i64 %t2037)
  %t2039 = call i64 @"sx_f64_sub"(i64 %t2035, i64 %t2038)
  store i64 %t2039, ptr %local.s_local.1651
  br label %then98_end
then98_end:
  br label %endif98
else98:
  br label %else98_end
else98_end:
  br label %endif98
endif98:
  %t2040 = phi i64 [ 0, %then98_end ], [ 0, %else98_end ]
  br label %then97_end
then97_end:
  br label %endif97
else97:
  br label %else97_end
else97_end:
  br label %endif97
endif97:
  %t2041 = phi i64 [ %t2040, %then97_end ], [ 0, %else97_end ]
  %t2042 = load i64, ptr %local.cycle.1627
  %t2043 = icmp sge i64 %t2042, 5
  %t2044 = zext i1 %t2043 to i64
  %t2045 = icmp ne i64 %t2044, 0
  br i1 %t2045, label %then99, label %else99
then99:
  %t2046 = load i64, ptr %local.sum_h.1633
  %t2047 = load i64, ptr %local.hm.1649
  %t2048 = call i64 @"sx_f64_add"(i64 %t2046, i64 %t2047)
  store i64 %t2048, ptr %local.sum_h.1633
  %t2049 = load i64, ptr %local.sum_sl.1634
  %t2050 = load i64, ptr %local.s_local.1651
  %t2051 = call i64 @"sx_f64_add"(i64 %t2049, i64 %t2050)
  store i64 %t2051, ptr %local.sum_sl.1634
  %t2052 = load i64, ptr %local.sum_h2.1635
  %t2053 = load i64, ptr %local.hm.1649
  %t2054 = load i64, ptr %local.hm.1649
  %t2055 = call i64 @"sx_f64_mul"(i64 %t2053, i64 %t2054)
  %t2056 = call i64 @"sx_f64_add"(i64 %t2052, i64 %t2055)
  store i64 %t2056, ptr %local.sum_h2.1635
  %t2057 = load i64, ptr %local.sum_sl2.1636
  %t2058 = load i64, ptr %local.s_local.1651
  %t2059 = load i64, ptr %local.s_local.1651
  %t2060 = call i64 @"sx_f64_mul"(i64 %t2058, i64 %t2059)
  %t2061 = call i64 @"sx_f64_add"(i64 %t2057, i64 %t2060)
  store i64 %t2061, ptr %local.sum_sl2.1636
  %t2062 = load i64, ptr %local.sum_hsl.1637
  %t2063 = load i64, ptr %local.hm.1649
  %t2064 = load i64, ptr %local.s_local.1651
  %t2065 = call i64 @"sx_f64_mul"(i64 %t2063, i64 %t2064)
  %t2066 = call i64 @"sx_f64_add"(i64 %t2062, i64 %t2065)
  store i64 %t2066, ptr %local.sum_hsl.1637
  %t2067 = load i64, ptr %local.n_corr.1638
  %t2068 = add i64 %t2067, 1
  store i64 %t2068, ptr %local.n_corr.1638
  br label %then99_end
then99_end:
  br label %endif99
else99:
  br label %else99_end
else99_end:
  br label %endif99
endif99:
  %t2069 = phi i64 [ 0, %then99_end ], [ 0, %else99_end ]
  %t2070 = load i64, ptr %local.cycle.1627
  %t2071 = srem i64 %t2070, 5
  %t2072 = icmp eq i64 %t2071, 0
  %t2073 = zext i1 %t2072 to i64
  %t2074 = icmp ne i64 %t2073, 0
  br i1 %t2074, label %then100, label %else100
then100:
  %t2075 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.230)
  %t2076 = ptrtoint ptr %t2075 to i64
  %t2077 = inttoptr i64 %t2076 to ptr
  call void @intrinsic_print(ptr %t2077)
  %t2078 = load i64, ptr %local.cycle.1627
  call void @print_i64(i64 %t2078)
  %t2079 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.231)
  %t2080 = ptrtoint ptr %t2079 to i64
  %t2081 = inttoptr i64 %t2080 to ptr
  call void @intrinsic_print(ptr %t2081)
  %t2082 = load i64, ptr %local.total_loss.1642
  %t2083 = call i64 @"print_f64"(i64 %t2082)
  %t2084 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.232)
  %t2085 = ptrtoint ptr %t2084 to i64
  %t2086 = inttoptr i64 %t2085 to ptr
  call void @intrinsic_print(ptr %t2086)
  %t2087 = load i64, ptr %local.hm.1649
  %t2088 = call i64 @"print_f64"(i64 %t2087)
  %t2089 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.233)
  %t2090 = ptrtoint ptr %t2089 to i64
  %t2091 = inttoptr i64 %t2090 to ptr
  call void @intrinsic_print(ptr %t2091)
  %t2092 = load i64, ptr %local.s_local.1651
  %t2093 = call i64 @"print_f64"(i64 %t2092)
  %t2094 = load i64, ptr %local.hm.1649
  %t2095 = call i64 @f64_parse(ptr @.str.exp_s_entropy.234)
  %t2096 = call i64 @"sx_f64_gt"(i64 %t2094, i64 %t2095)
  %t2097 = icmp ne i64 %t2096, 0
  br i1 %t2097, label %then101, label %else101
then101:
  %t2098 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.235)
  %t2099 = ptrtoint ptr %t2098 to i64
  %t2100 = inttoptr i64 %t2099 to ptr
  call void @intrinsic_println(ptr %t2100)
  br label %then101_end
then101_end:
  br label %endif101
else101:
  %t2101 = load i64, ptr %local.hm.1649
  %t2102 = call i64 @f64_parse(ptr @.str.exp_s_entropy.236)
  %t2103 = call i64 @"sx_f64_gt"(i64 %t2101, i64 %t2102)
  %t2104 = icmp ne i64 %t2103, 0
  br i1 %t2104, label %then102, label %else102
then102:
  %t2105 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.237)
  %t2106 = ptrtoint ptr %t2105 to i64
  %t2107 = inttoptr i64 %t2106 to ptr
  call void @intrinsic_println(ptr %t2107)
  br label %then102_end
then102_end:
  br label %endif102
else102:
  %t2108 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.238)
  %t2109 = ptrtoint ptr %t2108 to i64
  %t2110 = inttoptr i64 %t2109 to ptr
  call void @intrinsic_println(ptr %t2110)
  br label %else102_end
else102_end:
  br label %endif102
endif102:
  %t2111 = phi i64 [ 0, %then102_end ], [ 0, %else102_end ]
  br label %else101_end
else101_end:
  br label %endif101
endif101:
  %t2112 = phi i64 [ 0, %then101_end ], [ %t2111, %else101_end ]
  br label %then100_end
then100_end:
  br label %endif100
else100:
  br label %else100_end
else100_end:
  br label %endif100
endif100:
  %t2113 = phi i64 [ %t2112, %then100_end ], [ 0, %else100_end ]
  %t2114 = load i64, ptr %local.total_loss.1642
  store i64 %t2114, ptr %local.prev_total.1628
  %t2115 = load i64, ptr %local.cycle.1627
  %t2116 = add i64 %t2115, 1
  store i64 %t2116, ptr %local.cycle.1627
  br label %loop94
endloop94:
  %t2117 = call i64 @f64_parse(ptr @.str.exp_s_entropy.239)
  store i64 %t2117, ptr %local.s_final.1653
  %t2118 = load i64, ptr %local.count_e.1631
  %t2119 = icmp sgt i64 %t2118, 0
  %t2120 = zext i1 %t2119 to i64
  %t2121 = icmp ne i64 %t2120, 0
  br i1 %t2121, label %then103, label %else103
then103:
  %t2122 = load i64, ptr %local.count_l.1632
  %t2123 = icmp sgt i64 %t2122, 0
  %t2124 = zext i1 %t2123 to i64
  %t2125 = icmp ne i64 %t2124, 0
  br i1 %t2125, label %then104, label %else104
then104:
  %t2126 = load i64, ptr %local.early_drift.1629
  %t2127 = load i64, ptr %local.count_e.1631
  %t2128 = call i64 @"sx_int_to_f64"(i64 %t2127)
  %t2129 = call i64 @"sx_f64_div"(i64 %t2126, i64 %t2128)
  store i64 %t2129, ptr %local.avg_e.1654
  %t2130 = load i64, ptr %local.late_drift.1630
  %t2131 = load i64, ptr %local.count_l.1632
  %t2132 = call i64 @"sx_int_to_f64"(i64 %t2131)
  %t2133 = call i64 @"sx_f64_div"(i64 %t2130, i64 %t2132)
  store i64 %t2133, ptr %local.avg_l.1655
  %t2134 = load i64, ptr %local.avg_e.1654
  %t2135 = call i64 @f64_parse(ptr @.str.exp_s_entropy.240)
  %t2136 = call i64 @"sx_f64_gt"(i64 %t2134, i64 %t2135)
  %t2137 = icmp ne i64 %t2136, 0
  br i1 %t2137, label %then105, label %else105
then105:
  %t2138 = call i64 @f64_parse(ptr @.str.exp_s_entropy.241)
  %t2139 = load i64, ptr %local.avg_l.1655
  %t2140 = load i64, ptr %local.avg_e.1654
  %t2141 = call i64 @"sx_f64_div"(i64 %t2139, i64 %t2140)
  %t2142 = call i64 @"sx_f64_sub"(i64 %t2138, i64 %t2141)
  store i64 %t2142, ptr %local.s_final.1653
  br label %then105_end
then105_end:
  br label %endif105
else105:
  br label %else105_end
else105_end:
  br label %endif105
endif105:
  %t2143 = phi i64 [ 0, %then105_end ], [ 0, %else105_end ]
  br label %then104_end
then104_end:
  br label %endif104
else104:
  br label %else104_end
else104_end:
  br label %endif104
endif104:
  %t2144 = phi i64 [ %t2143, %then104_end ], [ 0, %else104_end ]
  br label %then103_end
then103_end:
  br label %endif103
else103:
  br label %else103_end
else103_end:
  br label %endif103
endif103:
  %t2145 = phi i64 [ %t2144, %then103_end ], [ 0, %else103_end ]
  %t2146 = load i64, ptr %local.n_corr.1638
  %t2147 = call i64 @"sx_int_to_f64"(i64 %t2146)
  store i64 %t2147, ptr %local.nf.1656
  %t2148 = load i64, ptr %local.nf.1656
  %t2149 = load i64, ptr %local.sum_hsl.1637
  %t2150 = call i64 @"sx_f64_mul"(i64 %t2148, i64 %t2149)
  %t2151 = load i64, ptr %local.sum_h.1633
  %t2152 = load i64, ptr %local.sum_sl.1634
  %t2153 = call i64 @"sx_f64_mul"(i64 %t2151, i64 %t2152)
  %t2154 = call i64 @"sx_f64_sub"(i64 %t2150, i64 %t2153)
  store i64 %t2154, ptr %local.num.1657
  %t2155 = load i64, ptr %local.nf.1656
  %t2156 = load i64, ptr %local.sum_h2.1635
  %t2157 = call i64 @"sx_f64_mul"(i64 %t2155, i64 %t2156)
  %t2158 = load i64, ptr %local.sum_h.1633
  %t2159 = load i64, ptr %local.sum_h.1633
  %t2160 = call i64 @"sx_f64_mul"(i64 %t2158, i64 %t2159)
  %t2161 = call i64 @"sx_f64_sub"(i64 %t2157, i64 %t2160)
  store i64 %t2161, ptr %local.da.1658
  %t2162 = load i64, ptr %local.nf.1656
  %t2163 = load i64, ptr %local.sum_sl2.1636
  %t2164 = call i64 @"sx_f64_mul"(i64 %t2162, i64 %t2163)
  %t2165 = load i64, ptr %local.sum_sl.1634
  %t2166 = load i64, ptr %local.sum_sl.1634
  %t2167 = call i64 @"sx_f64_mul"(i64 %t2165, i64 %t2166)
  %t2168 = call i64 @"sx_f64_sub"(i64 %t2164, i64 %t2167)
  store i64 %t2168, ptr %local.db.1659
  %t2169 = call i64 @f64_parse(ptr @.str.exp_s_entropy.242)
  store i64 %t2169, ptr %local.corr.1660
  %t2170 = load i64, ptr %local.da.1658
  %t2171 = call i64 @f64_parse(ptr @.str.exp_s_entropy.243)
  %t2172 = call i64 @"sx_f64_gt"(i64 %t2170, i64 %t2171)
  %t2173 = icmp ne i64 %t2172, 0
  br i1 %t2173, label %then106, label %else106
then106:
  %t2174 = load i64, ptr %local.db.1659
  %t2175 = call i64 @f64_parse(ptr @.str.exp_s_entropy.244)
  %t2176 = call i64 @"sx_f64_gt"(i64 %t2174, i64 %t2175)
  %t2177 = icmp ne i64 %t2176, 0
  br i1 %t2177, label %then107, label %else107
then107:
  %t2178 = load i64, ptr %local.num.1657
  %t2179 = load i64, ptr %local.da.1658
  %t2180 = load i64, ptr %local.db.1659
  %t2181 = call i64 @"sx_f64_mul"(i64 %t2179, i64 %t2180)
  %t2182 = call i64 @"sqrt_f64"(i64 %t2181)
  %t2183 = call i64 @"sx_f64_div"(i64 %t2178, i64 %t2182)
  store i64 %t2183, ptr %local.corr.1660
  br label %then107_end
then107_end:
  br label %endif107
else107:
  br label %else107_end
else107_end:
  br label %endif107
endif107:
  %t2184 = phi i64 [ 0, %then107_end ], [ 0, %else107_end ]
  br label %then106_end
then106_end:
  br label %endif106
else106:
  br label %else106_end
else106_end:
  br label %endif106
endif106:
  %t2185 = phi i64 [ %t2184, %then106_end ], [ 0, %else106_end ]
  %t2186 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.245)
  %t2187 = ptrtoint ptr %t2186 to i64
  %t2188 = inttoptr i64 %t2187 to ptr
  call void @intrinsic_println(ptr %t2188)
  %t2189 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.246)
  %t2190 = ptrtoint ptr %t2189 to i64
  %t2191 = inttoptr i64 %t2190 to ptr
  call void @intrinsic_print(ptr %t2191)
  %t2192 = load i64, ptr %local.s_final.1653
  %t2193 = call i64 @"print_f64"(i64 %t2192)
  %t2194 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.247)
  %t2195 = ptrtoint ptr %t2194 to i64
  %t2196 = inttoptr i64 %t2195 to ptr
  call void @intrinsic_println(ptr %t2196)
  %t2197 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.248)
  %t2198 = ptrtoint ptr %t2197 to i64
  %t2199 = inttoptr i64 %t2198 to ptr
  call void @intrinsic_print(ptr %t2199)
  %t2200 = load i64, ptr %local.corr.1660
  %t2201 = call i64 @"print_f64"(i64 %t2200)
  %t2202 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.249)
  %t2203 = ptrtoint ptr %t2202 to i64
  %t2204 = inttoptr i64 %t2203 to ptr
  call void @intrinsic_println(ptr %t2204)
  %t2205 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.250)
  %t2206 = ptrtoint ptr %t2205 to i64
  %t2207 = inttoptr i64 %t2206 to ptr
  call void @intrinsic_println(ptr %t2207)
  %t2208 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.251)
  %t2209 = ptrtoint ptr %t2208 to i64
  %t2210 = inttoptr i64 %t2209 to ptr
  call void @intrinsic_println(ptr %t2210)
  %t2211 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.252)
  %t2212 = ptrtoint ptr %t2211 to i64
  %t2213 = inttoptr i64 %t2212 to ptr
  call void @intrinsic_println(ptr %t2213)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t2214 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.253)
  %t2215 = ptrtoint ptr %t2214 to i64
  %t2216 = inttoptr i64 %t2215 to ptr
  call void @intrinsic_println(ptr %t2216)
  %t2217 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.254)
  %t2218 = ptrtoint ptr %t2217 to i64
  %t2219 = inttoptr i64 %t2218 to ptr
  call void @intrinsic_println(ptr %t2219)
  %t2220 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.255)
  %t2221 = ptrtoint ptr %t2220 to i64
  %t2222 = inttoptr i64 %t2221 to ptr
  call void @intrinsic_println(ptr %t2222)
  %t2223 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.256)
  %t2224 = ptrtoint ptr %t2223 to i64
  %t2225 = inttoptr i64 %t2224 to ptr
  call void @intrinsic_println(ptr %t2225)
  %t2226 = call i64 @"test_s_vs_shannon"()
  %t2227 = call i64 @"test_entropy_rate"()
  %t2228 = call i64 @"test_s_vs_ks"()
  %t2229 = call i64 @"test_matrix_entropy"()
  %t2230 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.257)
  %t2231 = ptrtoint ptr %t2230 to i64
  %t2232 = inttoptr i64 %t2231 to ptr
  call void @intrinsic_println(ptr %t2232)
  %t2233 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.258)
  %t2234 = ptrtoint ptr %t2233 to i64
  %t2235 = inttoptr i64 %t2234 to ptr
  call void @intrinsic_println(ptr %t2235)
  %t2236 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.259)
  %t2237 = ptrtoint ptr %t2236 to i64
  %t2238 = inttoptr i64 %t2237 to ptr
  call void @intrinsic_println(ptr %t2238)
  %t2239 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.260)
  %t2240 = ptrtoint ptr %t2239 to i64
  %t2241 = inttoptr i64 %t2240 to ptr
  call void @intrinsic_println(ptr %t2241)
  %t2242 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.261)
  %t2243 = ptrtoint ptr %t2242 to i64
  %t2244 = inttoptr i64 %t2243 to ptr
  call void @intrinsic_println(ptr %t2244)
  %t2245 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.262)
  %t2246 = ptrtoint ptr %t2245 to i64
  %t2247 = inttoptr i64 %t2246 to ptr
  call void @intrinsic_println(ptr %t2247)
  %t2248 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.263)
  %t2249 = ptrtoint ptr %t2248 to i64
  %t2250 = inttoptr i64 %t2249 to ptr
  call void @intrinsic_println(ptr %t2250)
  %t2251 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.264)
  %t2252 = ptrtoint ptr %t2251 to i64
  %t2253 = inttoptr i64 %t2252 to ptr
  call void @intrinsic_println(ptr %t2253)
  %t2254 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.265)
  %t2255 = ptrtoint ptr %t2254 to i64
  %t2256 = inttoptr i64 %t2255 to ptr
  call void @intrinsic_println(ptr %t2256)
  %t2257 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.266)
  %t2258 = ptrtoint ptr %t2257 to i64
  %t2259 = inttoptr i64 %t2258 to ptr
  call void @intrinsic_println(ptr %t2259)
  %t2260 = call ptr @intrinsic_string_new(ptr @.str.exp_s_entropy.267)
  %t2261 = ptrtoint ptr %t2260 to i64
  %t2262 = inttoptr i64 %t2261 to ptr
  call void @intrinsic_println(ptr %t2262)
  ret i64 0
}


; String constants
@.str.exp_s_entropy.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.2 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.5 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.6 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.7 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.9 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.12 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.13 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.14 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.16 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_s_entropy.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.19 = private unnamed_addr constant [6 x i8] c"500.0\00"
@.str.exp_s_entropy.20 = private unnamed_addr constant [52 x i8] c"--- Exp 1: S vs Shannon Entropy on Logistic Map ---\00"
@.str.exp_s_entropy.21 = private unnamed_addr constant [40 x i8] c"  10-bin histogram of last 500 iterates\00"
@.str.exp_s_entropy.22 = private unnamed_addr constant [49 x i8] c"  H = -sum(p_i * ln(p_i)), max H = ln(10) ~ 2.30\00"
@.str.exp_s_entropy.23 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.24 = private unnamed_addr constant [43 x i8] c"  r       S         H(Shannon)  Prediction\00"
@.str.exp_s_entropy.25 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_entropy.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.31 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_entropy.32 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.33 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.34 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.35 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.36 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.37 = private unnamed_addr constant [24 x i8] c"  S>0 + low H (ORDERED)\00"
@.str.exp_s_entropy.38 = private unnamed_addr constant [23 x i8] c"  S>0 + high H (mixed)\00"
@.str.exp_s_entropy.39 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.40 = private unnamed_addr constant [25 x i8] c"  S~0 + high H (CHAOTIC)\00"
@.str.exp_s_entropy.41 = private unnamed_addr constant [27 x i8] c"  S~0 + med H (transition)\00"
@.str.exp_s_entropy.42 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.45 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.47 = private unnamed_addr constant [30 x i8] c"  Pearson correlation(S, H): \00"
@.str.exp_s_entropy.48 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.49 = private unnamed_addr constant [57 x i8] c"  Expected: strong NEGATIVE correlation (S up => H down)\00"
@.str.exp_s_entropy.50 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.52 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.53 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.54 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_s_entropy.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.57 = private unnamed_addr constant [48 x i8] c"--- Exp 2: S vs Information Production Rate ---\00"
@.str.exp_s_entropy.58 = private unnamed_addr constant [54 x i8] c"  dH/dt = H(window2) - H(window1), window = 300 steps\00"
@.str.exp_s_entropy.59 = private unnamed_addr constant [64 x i8] c"  If S ~ -dH/dt, then S is the negative entropy production rate\00"
@.str.exp_s_entropy.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.61 = private unnamed_addr constant [67 x i8] c"  r       S         H1        H2        dH/dt     -dH/dt    match?\00"
@.str.exp_s_entropy.62 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_entropy.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.65 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.68 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_entropy.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.70 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.72 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_s_entropy.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.74 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.75 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_s_entropy.76 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.77 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.78 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.79 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.80 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.81 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.82 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.84 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_s_entropy.85 = private unnamed_addr constant [5 x i8] c"  no\00"
@.str.exp_s_entropy.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.87 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.89 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_s_entropy.90 = private unnamed_addr constant [5 x i8] c"  no\00"
@.str.exp_s_entropy.91 = private unnamed_addr constant [5 x i8] c"  ~0\00"
@.str.exp_s_entropy.92 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.97 = private unnamed_addr constant [19 x i8] c"  Sign agreement: \00"
@.str.exp_s_entropy.98 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.exp_s_entropy.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.100 = private unnamed_addr constant [35 x i8] c"  Pearson correlation(S, -dH/dt): \00"
@.str.exp_s_entropy.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.102 = private unnamed_addr constant [57 x i8] c"  If corr ~ 1: S IS the negative entropy production rate\00"
@.str.exp_s_entropy.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.104 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.106 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.107 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.108 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.109 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.110 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.111 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_s_entropy.112 = private unnamed_addr constant [45 x i8] c"--- Exp 3: S vs Kolmogorov-Sinai Entropy ---\00"
@.str.exp_s_entropy.113 = private unnamed_addr constant [34 x i8] c"  KS = max(0, lambda) for 1D maps\00"
@.str.exp_s_entropy.114 = private unnamed_addr constant [26 x i8] c"  Searching for S = f(KS)\00"
@.str.exp_s_entropy.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.116 = private unnamed_addr constant [58 x i8] c"  r       S         lambda    KS        1-KS/KS_max  S+KS\00"
@.str.exp_s_entropy.117 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_entropy.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.119 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_entropy.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.122 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.123 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_entropy.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.125 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.126 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.127 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.129 = private unnamed_addr constant [5 x i8] c"4.01\00"
@.str.exp_s_entropy.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.131 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.133 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_s_entropy.134 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.135 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.136 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.137 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.138 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.139 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.140 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.142 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_entropy.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.145 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.147 = private unnamed_addr constant [11 x i8] c"  KS_max: \00"
@.str.exp_s_entropy.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.149 = private unnamed_addr constant [31 x i8] c"  Pearson correlation(S, KS): \00"
@.str.exp_s_entropy.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.151 = private unnamed_addr constant [40 x i8] c"  Expected: strong NEGATIVE correlation\00"
@.str.exp_s_entropy.152 = private unnamed_addr constant [54 x i8] c"  If S ~ 1 - KS/KS_max: S is a normalised KS estimate\00"
@.str.exp_s_entropy.153 = private unnamed_addr constant [57 x i8] c"  If S + KS ~ const: S and KS are complementary measures\00"
@.str.exp_s_entropy.154 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.155 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.156 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.160 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.161 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.162 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.163 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.164 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.165 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.166 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.167 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.168 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.169 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.170 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.171 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.172 = private unnamed_addr constant [49 x i8] c"--- Exp 4: Entropy of the Interaction Matrix ---\00"
@.str.exp_s_entropy.173 = private unnamed_addr constant [59 x i8] c"  3-loss, 4-param system. Track H(M) and S over 60 cycles.\00"
@.str.exp_s_entropy.174 = private unnamed_addr constant [55 x i8] c"  H(M) = -sum(p_ij * ln(p_ij)), max H = ln(12) ~ 2.485\00"
@.str.exp_s_entropy.175 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.176 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_s_entropy.177 = private unnamed_addr constant [5 x i8] c"0.20\00"
@.str.exp_s_entropy.178 = private unnamed_addr constant [5 x i8] c"0.30\00"
@.str.exp_s_entropy.179 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_s_entropy.180 = private unnamed_addr constant [5 x i8] c"0.22\00"
@.str.exp_s_entropy.181 = private unnamed_addr constant [5 x i8] c"0.28\00"
@.str.exp_s_entropy.182 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_s_entropy.183 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_s_entropy.184 = private unnamed_addr constant [5 x i8] c"0.27\00"
@.str.exp_s_entropy.185 = private unnamed_addr constant [5 x i8] c"0.23\00"
@.str.exp_s_entropy.186 = private unnamed_addr constant [5 x i8] c"0.26\00"
@.str.exp_s_entropy.187 = private unnamed_addr constant [5 x i8] c"0.24\00"
@.str.exp_s_entropy.188 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.189 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.190 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.191 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.192 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.193 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.194 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.195 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_s_entropy.196 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.197 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.198 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_entropy.199 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_s_entropy.200 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.201 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_entropy.202 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.204 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_s_entropy.205 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_s_entropy.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.207 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.208 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.209 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.210 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.211 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.213 = private unnamed_addr constant [57 x i8] c"  cycle  L_total    H(M)       S_local    interpretation\00"
@.str.exp_s_entropy.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.215 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.216 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.217 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.218 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.219 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.220 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.221 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.222 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.223 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.224 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.225 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.226 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_entropy.227 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.228 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.230 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.231 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_s_entropy.232 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.233 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_s_entropy.234 = private unnamed_addr constant [4 x i8] c"2.4\00"
@.str.exp_s_entropy.235 = private unnamed_addr constant [12 x i8] c"  uniform M\00"
@.str.exp_s_entropy.236 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_entropy.237 = private unnamed_addr constant [14 x i8] c"  structuring\00"
@.str.exp_s_entropy.238 = private unnamed_addr constant [15 x i8] c"  structured M\00"
@.str.exp_s_entropy.239 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.240 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_s_entropy.241 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_entropy.242 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.243 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.244 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_entropy.245 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.246 = private unnamed_addr constant [31 x i8] c"  Final S (early/late drift): \00"
@.str.exp_s_entropy.247 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.248 = private unnamed_addr constant [39 x i8] c"  Pearson correlation(H(M), S_local): \00"
@.str.exp_s_entropy.249 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.250 = private unnamed_addr constant [66 x i8] c"  If corr < 0: as S increases, H(M) decreases (matrix structures)\00"
@.str.exp_s_entropy.251 = private unnamed_addr constant [67 x i8] c"  If corr > 0: as S increases, H(M) increases (matrix diversifies)\00"
@.str.exp_s_entropy.252 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.253 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_entropy.254 = private unnamed_addr constant [45 x i8] c"  S vs ENTROPY: THERMODYNAMIC INTERPRETATION\00"
@.str.exp_s_entropy.255 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_entropy.256 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_entropy.257 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_entropy.258 = private unnamed_addr constant [11 x i8] c"  SUMMARY:\00"
@.str.exp_s_entropy.259 = private unnamed_addr constant [48 x i8] c"  1. S vs Shannon H: negative correlation means\00"
@.str.exp_s_entropy.260 = private unnamed_addr constant [36 x i8] c"     S measures ORDER (low entropy)\00"
@.str.exp_s_entropy.261 = private unnamed_addr constant [46 x i8] c"  2. S vs dH/dt: if S ~ -dH/dt, then S is the\00"
@.str.exp_s_entropy.262 = private unnamed_addr constant [38 x i8] c"     negative entropy production rate\00"
@.str.exp_s_entropy.263 = private unnamed_addr constant [46 x i8] c"  3. S vs KS entropy: if S ~ 1-KS/max, then S\00"
@.str.exp_s_entropy.264 = private unnamed_addr constant [42 x i8] c"     is a model-free KS entropy estimator\00"
@.str.exp_s_entropy.265 = private unnamed_addr constant [41 x i8] c"  4. Matrix entropy H(M): tracks how the\00"
@.str.exp_s_entropy.266 = private unnamed_addr constant [40 x i8] c"     interaction structure crystallises\00"
@.str.exp_s_entropy.267 = private unnamed_addr constant [45 x i8] c"============================================\00"
