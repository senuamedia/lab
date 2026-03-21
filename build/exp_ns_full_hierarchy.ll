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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"max_f64"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t9 = load i64, ptr %local.a
  %t10 = load i64, ptr %local.b
  %t11 = call i64 @"sx_f64_gt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.a
  br label %then1_end
then1_end:
  br label %endif1
else1:
  %t14 = load i64, ptr %local.b
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t15 = phi i64 [ %t13, %then1_end ], [ %t14, %else1_end ]
  ret i64 %t15
}

define i64 @"bstep10"(i64 %u, i64 %nu, i64 %dt, i64 %dx, i64 %i) nounwind {
entry:
  %local.n.16 = alloca i64
  %local.im.17 = alloca i64
  %local.ip.18 = alloca i64
  %local.ui.19 = alloca i64
  %local.um.20 = alloca i64
  %local.up.21 = alloca i64
  %local.adv.22 = alloca i64
  %local.diff.23 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  store i64 10, ptr %local.n.16
  %t24 = load i64, ptr %local.i
  %t25 = sub i64 %t24, 1
  store i64 %t25, ptr %local.im.17
  %t26 = load i64, ptr %local.i
  %t27 = add i64 %t26, 1
  store i64 %t27, ptr %local.ip.18
  %t28 = load i64, ptr %local.im.17
  %t29 = icmp slt i64 %t28, 0
  %t30 = zext i1 %t29 to i64
  %t31 = icmp ne i64 %t30, 0
  br i1 %t31, label %then2, label %else2
then2:
  %t32 = load i64, ptr %local.n.16
  %t33 = sub i64 %t32, 1
  store i64 %t33, ptr %local.im.17
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t34 = phi i64 [ 0, %then2_end ], [ 0, %else2_end ]
  %t35 = load i64, ptr %local.ip.18
  %t36 = load i64, ptr %local.n.16
  %t37 = icmp sge i64 %t35, %t36
  %t38 = zext i1 %t37 to i64
  %t39 = icmp ne i64 %t38, 0
  br i1 %t39, label %then3, label %else3
then3:
  store i64 0, ptr %local.ip.18
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t40 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t41 = load i64, ptr %local.u
  %t42 = load i64, ptr %local.i
  %t43 = inttoptr i64 %t41 to ptr
  %t44 = call ptr @intrinsic_vec_get(ptr %t43, i64 %t42)
  %t45 = ptrtoint ptr %t44 to i64
  store i64 %t45, ptr %local.ui.19
  %t46 = load i64, ptr %local.u
  %t47 = load i64, ptr %local.im.17
  %t48 = inttoptr i64 %t46 to ptr
  %t49 = call ptr @intrinsic_vec_get(ptr %t48, i64 %t47)
  %t50 = ptrtoint ptr %t49 to i64
  store i64 %t50, ptr %local.um.20
  %t51 = load i64, ptr %local.u
  %t52 = load i64, ptr %local.ip.18
  %t53 = inttoptr i64 %t51 to ptr
  %t54 = call ptr @intrinsic_vec_get(ptr %t53, i64 %t52)
  %t55 = ptrtoint ptr %t54 to i64
  store i64 %t55, ptr %local.up.21
  %t56 = load i64, ptr %local.ui.19
  %t57 = load i64, ptr %local.up.21
  %t58 = load i64, ptr %local.um.20
  %t59 = call i64 @"sx_f64_sub"(i64 %t57, i64 %t58)
  %t60 = call i64 @"sx_f64_mul"(i64 %t56, i64 %t59)
  %t61 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.2)
  %t62 = load i64, ptr %local.dx
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = call i64 @"sx_f64_div"(i64 %t60, i64 %t63)
  store i64 %t64, ptr %local.adv.22
  %t65 = load i64, ptr %local.nu
  %t66 = load i64, ptr %local.up.21
  %t67 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.3)
  %t68 = load i64, ptr %local.ui.19
  %t69 = call i64 @"sx_f64_mul"(i64 %t67, i64 %t68)
  %t70 = call i64 @"sx_f64_sub"(i64 %t66, i64 %t69)
  %t71 = load i64, ptr %local.um.20
  %t72 = call i64 @"sx_f64_add"(i64 %t70, i64 %t71)
  %t73 = call i64 @"sx_f64_mul"(i64 %t65, i64 %t72)
  %t74 = load i64, ptr %local.dx
  %t75 = load i64, ptr %local.dx
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.diff.23
  %t78 = load i64, ptr %local.ui.19
  %t79 = load i64, ptr %local.dt
  %t80 = load i64, ptr %local.diff.23
  %t81 = load i64, ptr %local.adv.22
  %t82 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_mul"(i64 %t79, i64 %t82)
  %t84 = call i64 @"sx_f64_add"(i64 %t78, i64 %t83)
  ret i64 %t84
}

define i64 @"advance"(i64 %u, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.n.85 = alloca i64
  %local.out.86 = alloca i64
  %local.i.87 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  store i64 10, ptr %local.n.85
  %t88 = call ptr @intrinsic_vec_new()
  %t89 = ptrtoint ptr %t88 to i64
  store i64 %t89, ptr %local.out.86
  store i64 0, ptr %local.i.87
  br label %loop4
loop4:
  %t90 = load i64, ptr %local.i.87
  %t91 = load i64, ptr %local.n.85
  %t92 = icmp slt i64 %t90, %t91
  %t93 = zext i1 %t92 to i64
  %t94 = icmp ne i64 %t93, 0
  br i1 %t94, label %body4, label %endloop4
body4:
  %t95 = load i64, ptr %local.out.86
  %t96 = load i64, ptr %local.u
  %t97 = load i64, ptr %local.nu
  %t98 = load i64, ptr %local.dt
  %t99 = load i64, ptr %local.dx
  %t100 = load i64, ptr %local.i.87
  %t101 = call i64 @"bstep10"(i64 %t96, i64 %t97, i64 %t98, i64 %t99, i64 %t100)
  %t102 = inttoptr i64 %t95 to ptr
  %t103 = inttoptr i64 %t101 to ptr
  call void @intrinsic_vec_push(ptr %t102, ptr %t103)
  %t104 = load i64, ptr %local.i.87
  %t105 = add i64 %t104, 1
  store i64 %t105, ptr %local.i.87
  br label %loop4
endloop4:
  %t106 = load i64, ptr %local.out.86
  ret i64 %t106
}

define i64 @"max_grad_10"(i64 %u, i64 %dx) nounwind {
entry:
  %local.mg.107 = alloca i64
  %local.i.108 = alloca i64
  %local.ip.109 = alloca i64
  %local.g.110 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t111 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.4)
  store i64 %t111, ptr %local.mg.107
  store i64 0, ptr %local.i.108
  br label %loop5
loop5:
  %t112 = load i64, ptr %local.i.108
  %t113 = icmp slt i64 %t112, 10
  %t114 = zext i1 %t113 to i64
  %t115 = icmp ne i64 %t114, 0
  br i1 %t115, label %body5, label %endloop5
body5:
  %t116 = load i64, ptr %local.i.108
  %t117 = add i64 %t116, 1
  store i64 %t117, ptr %local.ip.109
  %t118 = load i64, ptr %local.ip.109
  %t119 = icmp sge i64 %t118, 10
  %t120 = zext i1 %t119 to i64
  %t121 = icmp ne i64 %t120, 0
  br i1 %t121, label %then6, label %else6
then6:
  store i64 0, ptr %local.ip.109
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t122 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t123 = load i64, ptr %local.u
  %t124 = load i64, ptr %local.ip.109
  %t125 = inttoptr i64 %t123 to ptr
  %t126 = call ptr @intrinsic_vec_get(ptr %t125, i64 %t124)
  %t127 = ptrtoint ptr %t126 to i64
  %t128 = load i64, ptr %local.u
  %t129 = load i64, ptr %local.i.108
  %t130 = inttoptr i64 %t128 to ptr
  %t131 = call ptr @intrinsic_vec_get(ptr %t130, i64 %t129)
  %t132 = ptrtoint ptr %t131 to i64
  %t133 = sub i64 %t127, %t132
  %t134 = call i64 @"abs_f64"(i64 %t133)
  %t135 = load i64, ptr %local.dx
  %t136 = call i64 @"sx_f64_div"(i64 %t134, i64 %t135)
  store i64 %t136, ptr %local.g.110
  %t137 = load i64, ptr %local.g.110
  %t138 = load i64, ptr %local.mg.107
  %t139 = call i64 @"sx_f64_gt"(i64 %t137, i64 %t138)
  %t140 = icmp ne i64 %t139, 0
  br i1 %t140, label %then7, label %else7
then7:
  %t141 = load i64, ptr %local.g.110
  store i64 %t141, ptr %local.mg.107
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t142 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t143 = load i64, ptr %local.i.108
  %t144 = add i64 %t143, 1
  store i64 %t144, ptr %local.i.108
  br label %loop5
endloop5:
  %t145 = load i64, ptr %local.mg.107
  ret i64 %t145
}

define i64 @"energy_10"(i64 %u) nounwind {
entry:
  %local.e.146 = alloca i64
  %local.i.147 = alloca i64
  %local.ui.148 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %t149 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.5)
  store i64 %t149, ptr %local.e.146
  store i64 0, ptr %local.i.147
  br label %loop8
loop8:
  %t150 = load i64, ptr %local.i.147
  %t151 = icmp slt i64 %t150, 10
  %t152 = zext i1 %t151 to i64
  %t153 = icmp ne i64 %t152, 0
  br i1 %t153, label %body8, label %endloop8
body8:
  %t154 = load i64, ptr %local.u
  %t155 = load i64, ptr %local.i.147
  %t156 = inttoptr i64 %t154 to ptr
  %t157 = call ptr @intrinsic_vec_get(ptr %t156, i64 %t155)
  %t158 = ptrtoint ptr %t157 to i64
  store i64 %t158, ptr %local.ui.148
  %t159 = load i64, ptr %local.e.146
  %t160 = load i64, ptr %local.ui.148
  %t161 = load i64, ptr %local.ui.148
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = call i64 @"sx_f64_add"(i64 %t159, i64 %t162)
  store i64 %t163, ptr %local.e.146
  %t164 = load i64, ptr %local.i.147
  %t165 = add i64 %t164, 1
  store i64 %t165, ptr %local.i.147
  br label %loop8
endloop8:
  %t166 = load i64, ptr %local.e.146
  %t167 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.6)
  %t168 = call i64 @"sx_f64_mul"(i64 %t166, i64 %t167)
  ret i64 %t168
}

define i64 @"max_u_10"(i64 %u) nounwind {
entry:
  %local.m.169 = alloca i64
  %local.i.170 = alloca i64
  %local.a.171 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %t172 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.7)
  store i64 %t172, ptr %local.m.169
  store i64 0, ptr %local.i.170
  br label %loop9
loop9:
  %t173 = load i64, ptr %local.i.170
  %t174 = icmp slt i64 %t173, 10
  %t175 = zext i1 %t174 to i64
  %t176 = icmp ne i64 %t175, 0
  br i1 %t176, label %body9, label %endloop9
body9:
  %t177 = load i64, ptr %local.u
  %t178 = load i64, ptr %local.i.170
  %t179 = inttoptr i64 %t177 to ptr
  %t180 = call ptr @intrinsic_vec_get(ptr %t179, i64 %t178)
  %t181 = ptrtoint ptr %t180 to i64
  %t182 = call i64 @"abs_f64"(i64 %t181)
  store i64 %t182, ptr %local.a.171
  %t183 = load i64, ptr %local.a.171
  %t184 = load i64, ptr %local.m.169
  %t185 = call i64 @"sx_f64_gt"(i64 %t183, i64 %t184)
  %t186 = icmp ne i64 %t185, 0
  br i1 %t186, label %then10, label %else10
then10:
  %t187 = load i64, ptr %local.a.171
  store i64 %t187, ptr %local.m.169
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t188 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t189 = load i64, ptr %local.i.170
  %t190 = add i64 %t189, 1
  store i64 %t190, ptr %local.i.170
  br label %loop9
endloop9:
  %t191 = load i64, ptr %local.m.169
  ret i64 %t191
}

define i64 @"iratio_forces"(i64 %u, i64 %nu, i64 %dx) nounwind {
entry:
  %local.cross.192 = alloca i64
  %local.norm_a.193 = alloca i64
  %local.norm_d.194 = alloca i64
  %local.i.195 = alloca i64
  %local.im.196 = alloca i64
  %local.ip.197 = alloca i64
  %local.ui.198 = alloca i64
  %local.um.199 = alloca i64
  %local.up.200 = alloca i64
  %local.adv.201 = alloca i64
  %local.diff.202 = alloca i64
  %local.ind.203 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t204 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.8)
  store i64 %t204, ptr %local.cross.192
  %t205 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.9)
  store i64 %t205, ptr %local.norm_a.193
  %t206 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.10)
  store i64 %t206, ptr %local.norm_d.194
  store i64 0, ptr %local.i.195
  br label %loop11
loop11:
  %t207 = load i64, ptr %local.i.195
  %t208 = icmp slt i64 %t207, 10
  %t209 = zext i1 %t208 to i64
  %t210 = icmp ne i64 %t209, 0
  br i1 %t210, label %body11, label %endloop11
body11:
  %t211 = load i64, ptr %local.i.195
  %t212 = sub i64 %t211, 1
  store i64 %t212, ptr %local.im.196
  %t213 = load i64, ptr %local.i.195
  %t214 = add i64 %t213, 1
  store i64 %t214, ptr %local.ip.197
  %t215 = load i64, ptr %local.im.196
  %t216 = icmp slt i64 %t215, 0
  %t217 = zext i1 %t216 to i64
  %t218 = icmp ne i64 %t217, 0
  br i1 %t218, label %then12, label %else12
then12:
  store i64 9, ptr %local.im.196
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t219 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t220 = load i64, ptr %local.ip.197
  %t221 = icmp sge i64 %t220, 10
  %t222 = zext i1 %t221 to i64
  %t223 = icmp ne i64 %t222, 0
  br i1 %t223, label %then13, label %else13
then13:
  store i64 0, ptr %local.ip.197
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t224 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t225 = load i64, ptr %local.u
  %t226 = load i64, ptr %local.i.195
  %t227 = inttoptr i64 %t225 to ptr
  %t228 = call ptr @intrinsic_vec_get(ptr %t227, i64 %t226)
  %t229 = ptrtoint ptr %t228 to i64
  store i64 %t229, ptr %local.ui.198
  %t230 = load i64, ptr %local.u
  %t231 = load i64, ptr %local.im.196
  %t232 = inttoptr i64 %t230 to ptr
  %t233 = call ptr @intrinsic_vec_get(ptr %t232, i64 %t231)
  %t234 = ptrtoint ptr %t233 to i64
  store i64 %t234, ptr %local.um.199
  %t235 = load i64, ptr %local.u
  %t236 = load i64, ptr %local.ip.197
  %t237 = inttoptr i64 %t235 to ptr
  %t238 = call ptr @intrinsic_vec_get(ptr %t237, i64 %t236)
  %t239 = ptrtoint ptr %t238 to i64
  store i64 %t239, ptr %local.up.200
  %t240 = load i64, ptr %local.ui.198
  %t241 = load i64, ptr %local.up.200
  %t242 = load i64, ptr %local.um.199
  %t243 = call i64 @"sx_f64_sub"(i64 %t241, i64 %t242)
  %t244 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t243)
  %t245 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.11)
  %t246 = load i64, ptr %local.dx
  %t247 = call i64 @"sx_f64_mul"(i64 %t245, i64 %t246)
  %t248 = call i64 @"sx_f64_div"(i64 %t244, i64 %t247)
  store i64 %t248, ptr %local.adv.201
  %t249 = load i64, ptr %local.nu
  %t250 = load i64, ptr %local.up.200
  %t251 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.12)
  %t252 = load i64, ptr %local.ui.198
  %t253 = call i64 @"sx_f64_mul"(i64 %t251, i64 %t252)
  %t254 = call i64 @"sx_f64_sub"(i64 %t250, i64 %t253)
  %t255 = load i64, ptr %local.um.199
  %t256 = call i64 @"sx_f64_add"(i64 %t254, i64 %t255)
  %t257 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t256)
  %t258 = load i64, ptr %local.dx
  %t259 = load i64, ptr %local.dx
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  %t261 = call i64 @"sx_f64_div"(i64 %t257, i64 %t260)
  store i64 %t261, ptr %local.diff.202
  %t262 = load i64, ptr %local.cross.192
  %t263 = load i64, ptr %local.adv.201
  %t264 = load i64, ptr %local.diff.202
  %t265 = call i64 @"sx_f64_mul"(i64 %t263, i64 %t264)
  %t266 = call i64 @"sx_f64_add"(i64 %t262, i64 %t265)
  store i64 %t266, ptr %local.cross.192
  %t267 = load i64, ptr %local.norm_a.193
  %t268 = load i64, ptr %local.adv.201
  %t269 = load i64, ptr %local.adv.201
  %t270 = call i64 @"sx_f64_mul"(i64 %t268, i64 %t269)
  %t271 = call i64 @"sx_f64_add"(i64 %t267, i64 %t270)
  store i64 %t271, ptr %local.norm_a.193
  %t272 = load i64, ptr %local.norm_d.194
  %t273 = load i64, ptr %local.diff.202
  %t274 = load i64, ptr %local.diff.202
  %t275 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t274)
  %t276 = call i64 @"sx_f64_add"(i64 %t272, i64 %t275)
  store i64 %t276, ptr %local.norm_d.194
  %t277 = load i64, ptr %local.i.195
  %t278 = add i64 %t277, 1
  store i64 %t278, ptr %local.i.195
  br label %loop11
endloop11:
  %t279 = load i64, ptr %local.norm_a.193
  %t280 = load i64, ptr %local.norm_d.194
  %t281 = call i64 @"sx_f64_add"(i64 %t279, i64 %t280)
  store i64 %t281, ptr %local.ind.203
  %t282 = load i64, ptr %local.ind.203
  %t283 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.13)
  %t284 = call i64 @"sx_f64_lt"(i64 %t282, i64 %t283)
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %then14, label %else14
then14:
  %t286 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.14)
  ret i64 %t286
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t287 = phi i64 [ 0, %else14_end ]
  %t288 = load i64, ptr %local.cross.192
  %t289 = load i64, ptr %local.ind.203
  %t290 = call i64 @"sx_f64_div"(i64 %t288, i64 %t289)
  ret i64 %t290
}

define i64 @"probe_margin"(i64 %u, i64 %eps, i64 %kick_idx, i64 %nu, i64 %dt, i64 %dx, i64 %probe_steps) nounwind {
entry:
  %local.a.291 = alloca i64
  %local.b.292 = alloca i64
  %local.i.293 = alloca i64
  %local.step.294 = alloca i64
  %local.ca.295 = alloca i64
  %local.cb.296 = alloca i64
  %local.div_sq.297 = alloca i64
  %local.d.298 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.eps = alloca i64
  store i64 %eps, ptr %local.eps
  %local.kick_idx = alloca i64
  store i64 %kick_idx, ptr %local.kick_idx
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.probe_steps = alloca i64
  store i64 %probe_steps, ptr %local.probe_steps
  %t299 = call ptr @intrinsic_vec_new()
  %t300 = ptrtoint ptr %t299 to i64
  store i64 %t300, ptr %local.a.291
  %t301 = call ptr @intrinsic_vec_new()
  %t302 = ptrtoint ptr %t301 to i64
  store i64 %t302, ptr %local.b.292
  store i64 0, ptr %local.i.293
  br label %loop15
loop15:
  %t303 = load i64, ptr %local.i.293
  %t304 = icmp slt i64 %t303, 10
  %t305 = zext i1 %t304 to i64
  %t306 = icmp ne i64 %t305, 0
  br i1 %t306, label %body15, label %endloop15
body15:
  %t307 = load i64, ptr %local.a.291
  %t308 = load i64, ptr %local.u
  %t309 = load i64, ptr %local.i.293
  %t310 = inttoptr i64 %t308 to ptr
  %t311 = call ptr @intrinsic_vec_get(ptr %t310, i64 %t309)
  %t312 = ptrtoint ptr %t311 to i64
  %t313 = inttoptr i64 %t307 to ptr
  %t314 = inttoptr i64 %t312 to ptr
  call void @intrinsic_vec_push(ptr %t313, ptr %t314)
  %t315 = load i64, ptr %local.i.293
  %t316 = load i64, ptr %local.kick_idx
  %t317 = icmp eq i64 %t315, %t316
  %t318 = zext i1 %t317 to i64
  %t319 = icmp ne i64 %t318, 0
  br i1 %t319, label %then16, label %else16
then16:
  %t320 = load i64, ptr %local.b.292
  %t321 = load i64, ptr %local.u
  %t322 = load i64, ptr %local.i.293
  %t323 = inttoptr i64 %t321 to ptr
  %t324 = call ptr @intrinsic_vec_get(ptr %t323, i64 %t322)
  %t325 = ptrtoint ptr %t324 to i64
  %t326 = load i64, ptr %local.eps
  %t327 = call i64 @"sx_f64_add"(i64 %t325, i64 %t326)
  %t328 = inttoptr i64 %t320 to ptr
  %t329 = inttoptr i64 %t327 to ptr
  call void @intrinsic_vec_push(ptr %t328, ptr %t329)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t330 = load i64, ptr %local.b.292
  %t331 = load i64, ptr %local.u
  %t332 = load i64, ptr %local.i.293
  %t333 = inttoptr i64 %t331 to ptr
  %t334 = call ptr @intrinsic_vec_get(ptr %t333, i64 %t332)
  %t335 = ptrtoint ptr %t334 to i64
  %t336 = inttoptr i64 %t330 to ptr
  %t337 = inttoptr i64 %t335 to ptr
  call void @intrinsic_vec_push(ptr %t336, ptr %t337)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t338 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t339 = load i64, ptr %local.i.293
  %t340 = add i64 %t339, 1
  store i64 %t340, ptr %local.i.293
  br label %loop15
endloop15:
  store i64 0, ptr %local.step.294
  %t341 = load i64, ptr %local.a.291
  store i64 %t341, ptr %local.ca.295
  %t342 = load i64, ptr %local.b.292
  store i64 %t342, ptr %local.cb.296
  br label %loop17
loop17:
  %t343 = load i64, ptr %local.step.294
  %t344 = load i64, ptr %local.probe_steps
  %t345 = icmp slt i64 %t343, %t344
  %t346 = zext i1 %t345 to i64
  %t347 = icmp ne i64 %t346, 0
  br i1 %t347, label %body17, label %endloop17
body17:
  %t348 = load i64, ptr %local.ca.295
  %t349 = load i64, ptr %local.nu
  %t350 = load i64, ptr %local.dt
  %t351 = load i64, ptr %local.dx
  %t352 = call i64 @"advance"(i64 %t348, i64 %t349, i64 %t350, i64 %t351)
  store i64 %t352, ptr %local.ca.295
  %t353 = load i64, ptr %local.cb.296
  %t354 = load i64, ptr %local.nu
  %t355 = load i64, ptr %local.dt
  %t356 = load i64, ptr %local.dx
  %t357 = call i64 @"advance"(i64 %t353, i64 %t354, i64 %t355, i64 %t356)
  store i64 %t357, ptr %local.cb.296
  %t358 = load i64, ptr %local.step.294
  %t359 = add i64 %t358, 1
  store i64 %t359, ptr %local.step.294
  br label %loop17
endloop17:
  %t360 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.15)
  store i64 %t360, ptr %local.div_sq.297
  store i64 0, ptr %local.i.293
  br label %loop18
loop18:
  %t361 = load i64, ptr %local.i.293
  %t362 = icmp slt i64 %t361, 10
  %t363 = zext i1 %t362 to i64
  %t364 = icmp ne i64 %t363, 0
  br i1 %t364, label %body18, label %endloop18
body18:
  %t365 = load i64, ptr %local.ca.295
  %t366 = load i64, ptr %local.i.293
  %t367 = inttoptr i64 %t365 to ptr
  %t368 = call ptr @intrinsic_vec_get(ptr %t367, i64 %t366)
  %t369 = ptrtoint ptr %t368 to i64
  %t370 = load i64, ptr %local.cb.296
  %t371 = load i64, ptr %local.i.293
  %t372 = inttoptr i64 %t370 to ptr
  %t373 = call ptr @intrinsic_vec_get(ptr %t372, i64 %t371)
  %t374 = ptrtoint ptr %t373 to i64
  %t375 = sub i64 %t369, %t374
  store i64 %t375, ptr %local.d.298
  %t376 = load i64, ptr %local.div_sq.297
  %t377 = load i64, ptr %local.d.298
  %t378 = load i64, ptr %local.d.298
  %t379 = call i64 @"sx_f64_mul"(i64 %t377, i64 %t378)
  %t380 = call i64 @"sx_f64_add"(i64 %t376, i64 %t379)
  store i64 %t380, ptr %local.div_sq.297
  %t381 = load i64, ptr %local.i.293
  %t382 = add i64 %t381, 1
  store i64 %t382, ptr %local.i.293
  br label %loop18
endloop18:
  %t383 = load i64, ptr %local.div_sq.297
  %t384 = call i64 @"sqrt_f64"(i64 %t383)
  %t385 = load i64, ptr %local.eps
  %t386 = call i64 @"abs_f64"(i64 %t385)
  %t387 = call i64 @"sx_f64_div"(i64 %t384, i64 %t386)
  ret i64 %t387
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.pi.388 = alloca i64
  %local.nu.389 = alloca i64
  %local.dx.390 = alloca i64
  %local.dt.391 = alloca i64
  %local.eps_probe.392 = alloca i64
  %local.probe_steps.393 = alloca i64
  %local.u.394 = alloca i64
  %local.i.395 = alloca i64
  %local.x.396 = alloca i64
  %local.cur_u.397 = alloca i64
  %local.prev_grad.398 = alloca i64
  %local.prev_drift.399 = alloca i64
  %local.prev_s.400 = alloca i64
  %local.prev_sp.401 = alloca i64
  %local.prev_m.402 = alloca i64
  %local.prev_dm.403 = alloca i64
  %local.step.404 = alloca i64
  %local.detect_s.405 = alloca i64
  %local.detect_sp.406 = alloca i64
  %local.detect_spp.407 = alloca i64
  %local.detect_m.408 = alloca i64
  %local.detect_dm.409 = alloca i64
  %local.detect_d2m.410 = alloca i64
  %local.detect_grad.411 = alloca i64
  %local.total_steps.412 = alloca i64
  %local.checkpoint.413 = alloca i64
  %local.mu.414 = alloca i64
  %local.mg.415 = alloca i64
  %local.ir.416 = alloca i64
  %local.drift.417 = alloca i64
  %local.s_val.418 = alloca i64
  %local.sp.419 = alloca i64
  %local.spp.420 = alloca i64
  %local.m_val.421 = alloca i64
  %local.dm.422 = alloca i64
  %local.d2m.423 = alloca i64
  %local.e.424 = alloca i64
  %local.best_e.425 = alloca i64
  %local.best_m.426 = alloca i64
  %local.sw.427 = alloca i64
  %local.mv.428 = alloca i64
  %t429 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.16)
  %t430 = ptrtoint ptr %t429 to i64
  %t431 = inttoptr i64 %t430 to ptr
  call void @intrinsic_println(ptr %t431)
  %t432 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.17)
  %t433 = ptrtoint ptr %t432 to i64
  %t434 = inttoptr i64 %t433 to ptr
  call void @intrinsic_println(ptr %t434)
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.18)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_println(ptr %t437)
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.19)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_println(ptr %t440)
  %t441 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.20)
  %t442 = ptrtoint ptr %t441 to i64
  %t443 = inttoptr i64 %t442 to ptr
  call void @intrinsic_println(ptr %t443)
  %t444 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.21)
  store i64 %t444, ptr %local.pi.388
  %t445 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.22)
  store i64 %t445, ptr %local.nu.389
  %t446 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.23)
  store i64 %t446, ptr %local.dx.390
  %t447 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.24)
  store i64 %t447, ptr %local.dt.391
  %t448 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.25)
  store i64 %t448, ptr %local.eps_probe.392
  store i64 100, ptr %local.probe_steps.393
  %t449 = call ptr @intrinsic_vec_new()
  %t450 = ptrtoint ptr %t449 to i64
  store i64 %t450, ptr %local.u.394
  store i64 0, ptr %local.i.395
  br label %loop19
loop19:
  %t451 = load i64, ptr %local.i.395
  %t452 = icmp slt i64 %t451, 10
  %t453 = zext i1 %t452 to i64
  %t454 = icmp ne i64 %t453, 0
  br i1 %t454, label %body19, label %endloop19
body19:
  %t455 = load i64, ptr %local.i.395
  %t456 = call i64 @"sx_int_to_f64"(i64 %t455)
  %t457 = load i64, ptr %local.dx.390
  %t458 = call i64 @"sx_f64_mul"(i64 %t456, i64 %t457)
  store i64 %t458, ptr %local.x.396
  %t459 = load i64, ptr %local.u.394
  %t460 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.26)
  %t461 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.27)
  %t462 = load i64, ptr %local.pi.388
  %t463 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t462)
  %t464 = load i64, ptr %local.x.396
  %t465 = call i64 @"sx_f64_mul"(i64 %t463, i64 %t464)
  %t466 = call i64 @"sin_f64"(i64 %t465)
  %t467 = call i64 @"sx_f64_mul"(i64 %t460, i64 %t466)
  %t468 = inttoptr i64 %t459 to ptr
  %t469 = inttoptr i64 %t467 to ptr
  call void @intrinsic_vec_push(ptr %t468, ptr %t469)
  %t470 = load i64, ptr %local.i.395
  %t471 = add i64 %t470, 1
  store i64 %t471, ptr %local.i.395
  br label %loop19
endloop19:
  %t472 = load i64, ptr %local.u.394
  store i64 %t472, ptr %local.cur_u.397
  %t473 = load i64, ptr %local.u.394
  %t474 = load i64, ptr %local.dx.390
  %t475 = call i64 @"max_grad_10"(i64 %t473, i64 %t474)
  store i64 %t475, ptr %local.prev_grad.398
  %t476 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.28)
  store i64 %t476, ptr %local.prev_drift.399
  %t477 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.29)
  store i64 %t477, ptr %local.prev_s.400
  %t478 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.30)
  store i64 %t478, ptr %local.prev_sp.401
  %t479 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.31)
  store i64 %t479, ptr %local.prev_m.402
  %t480 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.32)
  store i64 %t480, ptr %local.prev_dm.403
  store i64 0, ptr %local.step.404
  %t481 = sub i64 0, 1
  store i64 %t481, ptr %local.detect_s.405
  %t482 = sub i64 0, 1
  store i64 %t482, ptr %local.detect_sp.406
  %t483 = sub i64 0, 1
  store i64 %t483, ptr %local.detect_spp.407
  %t484 = sub i64 0, 1
  store i64 %t484, ptr %local.detect_m.408
  %t485 = sub i64 0, 1
  store i64 %t485, ptr %local.detect_dm.409
  %t486 = sub i64 0, 1
  store i64 %t486, ptr %local.detect_d2m.410
  %t487 = sub i64 0, 1
  store i64 %t487, ptr %local.detect_grad.411
  %t488 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.33)
  %t489 = ptrtoint ptr %t488 to i64
  %t490 = inttoptr i64 %t489 to ptr
  call void @intrinsic_println(ptr %t490)
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.34)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_println(ptr %t493)
  store i64 10000, ptr %local.total_steps.412
  store i64 1000, ptr %local.checkpoint.413
  br label %loop20
loop20:
  %t494 = load i64, ptr %local.step.404
  %t495 = load i64, ptr %local.total_steps.412
  %t496 = icmp slt i64 %t494, %t495
  %t497 = zext i1 %t496 to i64
  %t498 = icmp ne i64 %t497, 0
  br i1 %t498, label %body20, label %endloop20
body20:
  %t499 = load i64, ptr %local.cur_u.397
  %t500 = load i64, ptr %local.nu.389
  %t501 = load i64, ptr %local.dt.391
  %t502 = load i64, ptr %local.dx.390
  %t503 = call i64 @"advance"(i64 %t499, i64 %t500, i64 %t501, i64 %t502)
  store i64 %t503, ptr %local.cur_u.397
  %t504 = load i64, ptr %local.cur_u.397
  %t505 = call i64 @"max_u_10"(i64 %t504)
  store i64 %t505, ptr %local.mu.414
  %t506 = load i64, ptr %local.cur_u.397
  %t507 = load i64, ptr %local.dx.390
  %t508 = call i64 @"max_grad_10"(i64 %t506, i64 %t507)
  store i64 %t508, ptr %local.mg.415
  %t509 = load i64, ptr %local.cur_u.397
  %t510 = load i64, ptr %local.nu.389
  %t511 = load i64, ptr %local.dx.390
  %t512 = call i64 @"iratio_forces"(i64 %t509, i64 %t510, i64 %t511)
  store i64 %t512, ptr %local.ir.416
  %t513 = load i64, ptr %local.mg.415
  %t514 = load i64, ptr %local.prev_grad.398
  %t515 = call i64 @"sx_f64_sub"(i64 %t513, i64 %t514)
  %t516 = call i64 @"abs_f64"(i64 %t515)
  store i64 %t516, ptr %local.drift.417
  %t517 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.35)
  store i64 %t517, ptr %local.s_val.418
  %t518 = load i64, ptr %local.prev_drift.399
  %t519 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.36)
  %t520 = call i64 @"sx_f64_gt"(i64 %t518, i64 %t519)
  %t521 = icmp ne i64 %t520, 0
  br i1 %t521, label %then21, label %else21
then21:
  %t522 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.37)
  %t523 = load i64, ptr %local.drift.417
  %t524 = load i64, ptr %local.prev_drift.399
  %t525 = call i64 @"sx_f64_div"(i64 %t523, i64 %t524)
  %t526 = call i64 @"sx_f64_sub"(i64 %t522, i64 %t525)
  store i64 %t526, ptr %local.s_val.418
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t527 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t528 = load i64, ptr %local.s_val.418
  %t529 = load i64, ptr %local.prev_s.400
  %t530 = call i64 @"sx_f64_sub"(i64 %t528, i64 %t529)
  store i64 %t530, ptr %local.sp.419
  %t531 = load i64, ptr %local.sp.419
  %t532 = load i64, ptr %local.prev_sp.401
  %t533 = call i64 @"sx_f64_sub"(i64 %t531, i64 %t532)
  store i64 %t533, ptr %local.spp.420
  %t534 = load i64, ptr %local.prev_m.402
  store i64 %t534, ptr %local.m_val.421
  %t535 = load i64, ptr %local.prev_dm.403
  store i64 %t535, ptr %local.dm.422
  %t536 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.38)
  store i64 %t536, ptr %local.d2m.423
  %t537 = load i64, ptr %local.step.404
  %t538 = load i64, ptr %local.checkpoint.413
  %t539 = srem i64 %t537, %t538
  %t540 = icmp eq i64 %t539, 0
  %t541 = zext i1 %t540 to i64
  %t542 = icmp ne i64 %t541, 0
  br i1 %t542, label %then22, label %else22
then22:
  %t543 = load i64, ptr %local.step.404
  %t544 = icmp sgt i64 %t543, 0
  %t545 = zext i1 %t544 to i64
  %t546 = icmp ne i64 %t545, 0
  br i1 %t546, label %then23, label %else23
then23:
  %t547 = load i64, ptr %local.cur_u.397
  %t548 = load i64, ptr %local.eps_probe.392
  %t549 = load i64, ptr %local.nu.389
  %t550 = load i64, ptr %local.dt.391
  %t551 = load i64, ptr %local.dx.390
  %t552 = load i64, ptr %local.probe_steps.393
  %t553 = call i64 @"probe_margin"(i64 %t547, i64 %t548, i64 5, i64 %t549, i64 %t550, i64 %t551, i64 %t552)
  store i64 %t553, ptr %local.m_val.421
  %t554 = load i64, ptr %local.m_val.421
  %t555 = load i64, ptr %local.prev_m.402
  %t556 = call i64 @"sx_f64_sub"(i64 %t554, i64 %t555)
  store i64 %t556, ptr %local.dm.422
  %t557 = load i64, ptr %local.dm.422
  %t558 = load i64, ptr %local.prev_dm.403
  %t559 = call i64 @"sx_f64_sub"(i64 %t557, i64 %t558)
  store i64 %t559, ptr %local.d2m.423
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t560 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t561 = phi i64 [ %t560, %then22_end ], [ 0, %else22_end ]
  %t562 = load i64, ptr %local.s_val.418
  %t563 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.39)
  %t564 = call i64 @"sx_f64_lt"(i64 %t562, i64 %t563)
  %t565 = icmp ne i64 %t564, 0
  br i1 %t565, label %then24, label %else24
then24:
  %t566 = load i64, ptr %local.detect_s.405
  %t567 = sub i64 0, 1
  %t568 = icmp eq i64 %t566, %t567
  %t569 = zext i1 %t568 to i64
  %t570 = icmp ne i64 %t569, 0
  br i1 %t570, label %then25, label %else25
then25:
  %t571 = load i64, ptr %local.step.404
  store i64 %t571, ptr %local.detect_s.405
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t572 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t573 = phi i64 [ %t572, %then24_end ], [ 0, %else24_end ]
  %t574 = load i64, ptr %local.sp.419
  %t575 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.40)
  %t576 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.41)
  %t577 = call i64 @"sx_f64_sub"(i64 %t575, i64 %t576)
  %t578 = call i64 @"sx_f64_lt"(i64 %t574, i64 %t577)
  %t579 = icmp ne i64 %t578, 0
  br i1 %t579, label %then26, label %else26
then26:
  %t580 = load i64, ptr %local.detect_sp.406
  %t581 = sub i64 0, 1
  %t582 = icmp eq i64 %t580, %t581
  %t583 = zext i1 %t582 to i64
  %t584 = icmp ne i64 %t583, 0
  br i1 %t584, label %then27, label %else27
then27:
  %t585 = load i64, ptr %local.step.404
  store i64 %t585, ptr %local.detect_sp.406
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t586 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t587 = phi i64 [ %t586, %then26_end ], [ 0, %else26_end ]
  %t588 = load i64, ptr %local.spp.420
  %t589 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.42)
  %t590 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.43)
  %t591 = call i64 @"sx_f64_sub"(i64 %t589, i64 %t590)
  %t592 = call i64 @"sx_f64_lt"(i64 %t588, i64 %t591)
  %t593 = icmp ne i64 %t592, 0
  br i1 %t593, label %then28, label %else28
then28:
  %t594 = load i64, ptr %local.detect_spp.407
  %t595 = sub i64 0, 1
  %t596 = icmp eq i64 %t594, %t595
  %t597 = zext i1 %t596 to i64
  %t598 = icmp ne i64 %t597, 0
  br i1 %t598, label %then29, label %else29
then29:
  %t599 = load i64, ptr %local.step.404
  store i64 %t599, ptr %local.detect_spp.407
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t600 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t601 = phi i64 [ %t600, %then28_end ], [ 0, %else28_end ]
  %t602 = load i64, ptr %local.m_val.421
  %t603 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.44)
  %t604 = call i64 @"sx_f64_gt"(i64 %t602, i64 %t603)
  %t605 = icmp ne i64 %t604, 0
  br i1 %t605, label %then30, label %else30
then30:
  %t606 = load i64, ptr %local.detect_m.408
  %t607 = sub i64 0, 1
  %t608 = icmp eq i64 %t606, %t607
  %t609 = zext i1 %t608 to i64
  %t610 = icmp ne i64 %t609, 0
  br i1 %t610, label %then31, label %else31
then31:
  %t611 = load i64, ptr %local.step.404
  store i64 %t611, ptr %local.detect_m.408
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t612 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t613 = phi i64 [ %t612, %then30_end ], [ 0, %else30_end ]
  %t614 = load i64, ptr %local.dm.422
  %t615 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.45)
  %t616 = call i64 @"sx_f64_gt"(i64 %t614, i64 %t615)
  %t617 = icmp ne i64 %t616, 0
  br i1 %t617, label %then32, label %else32
then32:
  %t618 = load i64, ptr %local.detect_dm.409
  %t619 = sub i64 0, 1
  %t620 = icmp eq i64 %t618, %t619
  %t621 = zext i1 %t620 to i64
  %t622 = icmp ne i64 %t621, 0
  br i1 %t622, label %then33, label %else33
then33:
  %t623 = load i64, ptr %local.step.404
  store i64 %t623, ptr %local.detect_dm.409
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t624 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t625 = phi i64 [ %t624, %then32_end ], [ 0, %else32_end ]
  %t626 = load i64, ptr %local.d2m.423
  %t627 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.46)
  %t628 = call i64 @"sx_f64_gt"(i64 %t626, i64 %t627)
  %t629 = icmp ne i64 %t628, 0
  br i1 %t629, label %then34, label %else34
then34:
  %t630 = load i64, ptr %local.detect_d2m.410
  %t631 = sub i64 0, 1
  %t632 = icmp eq i64 %t630, %t631
  %t633 = zext i1 %t632 to i64
  %t634 = icmp ne i64 %t633, 0
  br i1 %t634, label %then35, label %else35
then35:
  %t635 = load i64, ptr %local.step.404
  store i64 %t635, ptr %local.detect_d2m.410
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t636 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t637 = phi i64 [ %t636, %then34_end ], [ 0, %else34_end ]
  %t638 = load i64, ptr %local.mg.415
  %t639 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.47)
  %t640 = call i64 @"sx_f64_gt"(i64 %t638, i64 %t639)
  %t641 = icmp ne i64 %t640, 0
  br i1 %t641, label %then36, label %else36
then36:
  %t642 = load i64, ptr %local.detect_grad.411
  %t643 = sub i64 0, 1
  %t644 = icmp eq i64 %t642, %t643
  %t645 = zext i1 %t644 to i64
  %t646 = icmp ne i64 %t645, 0
  br i1 %t646, label %then37, label %else37
then37:
  %t647 = load i64, ptr %local.step.404
  store i64 %t647, ptr %local.detect_grad.411
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t648 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t649 = phi i64 [ %t648, %then36_end ], [ 0, %else36_end ]
  %t650 = load i64, ptr %local.step.404
  %t651 = load i64, ptr %local.checkpoint.413
  %t652 = srem i64 %t650, %t651
  %t653 = icmp eq i64 %t652, 0
  %t654 = zext i1 %t653 to i64
  %t655 = icmp ne i64 %t654, 0
  br i1 %t655, label %then38, label %else38
then38:
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.48)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_print(ptr %t658)
  %t659 = load i64, ptr %local.step.404
  call void @print_i64(i64 %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.49)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_print(ptr %t662)
  %t663 = load i64, ptr %local.mu.414
  %t664 = call i64 @"print_f64"(i64 %t663)
  %t665 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.50)
  %t666 = ptrtoint ptr %t665 to i64
  %t667 = inttoptr i64 %t666 to ptr
  call void @intrinsic_print(ptr %t667)
  %t668 = load i64, ptr %local.mg.415
  %t669 = call i64 @"print_f64"(i64 %t668)
  %t670 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.51)
  %t671 = ptrtoint ptr %t670 to i64
  %t672 = inttoptr i64 %t671 to ptr
  call void @intrinsic_print(ptr %t672)
  %t673 = load i64, ptr %local.ir.416
  %t674 = call i64 @"print_f64"(i64 %t673)
  %t675 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.52)
  %t676 = ptrtoint ptr %t675 to i64
  %t677 = inttoptr i64 %t676 to ptr
  call void @intrinsic_print(ptr %t677)
  %t678 = load i64, ptr %local.s_val.418
  %t679 = call i64 @"print_f64"(i64 %t678)
  %t680 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.53)
  %t681 = ptrtoint ptr %t680 to i64
  %t682 = inttoptr i64 %t681 to ptr
  call void @intrinsic_print(ptr %t682)
  %t683 = load i64, ptr %local.sp.419
  %t684 = call i64 @"print_f64"(i64 %t683)
  %t685 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.54)
  %t686 = ptrtoint ptr %t685 to i64
  %t687 = inttoptr i64 %t686 to ptr
  call void @intrinsic_print(ptr %t687)
  %t688 = load i64, ptr %local.spp.420
  %t689 = call i64 @"print_f64"(i64 %t688)
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.55)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_print(ptr %t692)
  %t693 = load i64, ptr %local.m_val.421
  %t694 = call i64 @"print_f64"(i64 %t693)
  %t695 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.56)
  %t696 = ptrtoint ptr %t695 to i64
  %t697 = inttoptr i64 %t696 to ptr
  call void @intrinsic_print(ptr %t697)
  %t698 = load i64, ptr %local.dm.422
  %t699 = call i64 @"print_f64"(i64 %t698)
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.57)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_print(ptr %t702)
  %t703 = load i64, ptr %local.d2m.423
  %t704 = call i64 @"print_f64"(i64 %t703)
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.58)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_println(ptr %t707)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t708 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t709 = load i64, ptr %local.mg.415
  store i64 %t709, ptr %local.prev_grad.398
  %t710 = load i64, ptr %local.drift.417
  store i64 %t710, ptr %local.prev_drift.399
  %t711 = load i64, ptr %local.sp.419
  store i64 %t711, ptr %local.prev_sp.401
  %t712 = load i64, ptr %local.s_val.418
  store i64 %t712, ptr %local.prev_s.400
  %t713 = load i64, ptr %local.step.404
  %t714 = load i64, ptr %local.checkpoint.413
  %t715 = srem i64 %t713, %t714
  %t716 = icmp eq i64 %t715, 0
  %t717 = zext i1 %t716 to i64
  %t718 = icmp ne i64 %t717, 0
  br i1 %t718, label %then39, label %else39
then39:
  %t719 = load i64, ptr %local.dm.422
  store i64 %t719, ptr %local.prev_dm.403
  %t720 = load i64, ptr %local.m_val.421
  store i64 %t720, ptr %local.prev_m.402
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t721 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t722 = load i64, ptr %local.step.404
  %t723 = add i64 %t722, 1
  store i64 %t723, ptr %local.step.404
  br label %loop20
endloop20:
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.59)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_println(ptr %t726)
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.60)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_println(ptr %t729)
  %t730 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.61)
  %t731 = ptrtoint ptr %t730 to i64
  %t732 = inttoptr i64 %t731 to ptr
  call void @intrinsic_println(ptr %t732)
  %t733 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.62)
  %t734 = ptrtoint ptr %t733 to i64
  %t735 = inttoptr i64 %t734 to ptr
  call void @intrinsic_println(ptr %t735)
  %t736 = load i64, ptr %local.u.394
  store i64 %t736, ptr %local.cur_u.397
  store i64 0, ptr %local.step.404
  br label %loop40
loop40:
  %t737 = load i64, ptr %local.step.404
  %t738 = icmp slt i64 %t737, 5000
  %t739 = zext i1 %t738 to i64
  %t740 = icmp ne i64 %t739, 0
  br i1 %t740, label %body40, label %endloop40
body40:
  %t741 = load i64, ptr %local.cur_u.397
  %t742 = load i64, ptr %local.nu.389
  %t743 = load i64, ptr %local.dt.391
  %t744 = load i64, ptr %local.dx.390
  %t745 = call i64 @"advance"(i64 %t741, i64 %t742, i64 %t743, i64 %t744)
  store i64 %t745, ptr %local.cur_u.397
  %t746 = load i64, ptr %local.step.404
  %t747 = add i64 %t746, 1
  store i64 %t747, ptr %local.step.404
  br label %loop40
endloop40:
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.63)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_println(ptr %t750)
  %t751 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.64)
  store i64 %t751, ptr %local.e.424
  %t752 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.65)
  store i64 %t752, ptr %local.best_e.425
  %t753 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.66)
  store i64 %t753, ptr %local.best_m.426
  store i64 0, ptr %local.sw.427
  br label %loop41
loop41:
  %t754 = load i64, ptr %local.sw.427
  %t755 = icmp slt i64 %t754, 7
  %t756 = zext i1 %t755 to i64
  %t757 = icmp ne i64 %t756, 0
  br i1 %t757, label %body41, label %endloop41
body41:
  %t758 = load i64, ptr %local.cur_u.397
  %t759 = load i64, ptr %local.e.424
  %t760 = load i64, ptr %local.nu.389
  %t761 = load i64, ptr %local.dt.391
  %t762 = load i64, ptr %local.dx.390
  %t763 = load i64, ptr %local.probe_steps.393
  %t764 = call i64 @"probe_margin"(i64 %t758, i64 %t759, i64 5, i64 %t760, i64 %t761, i64 %t762, i64 %t763)
  store i64 %t764, ptr %local.mv.428
  %t765 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.67)
  %t766 = ptrtoint ptr %t765 to i64
  %t767 = inttoptr i64 %t766 to ptr
  call void @intrinsic_print(ptr %t767)
  %t768 = load i64, ptr %local.e.424
  %t769 = call i64 @"print_f64"(i64 %t768)
  %t770 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.68)
  %t771 = ptrtoint ptr %t770 to i64
  %t772 = inttoptr i64 %t771 to ptr
  call void @intrinsic_print(ptr %t772)
  %t773 = load i64, ptr %local.mv.428
  %t774 = call i64 @"print_f64"(i64 %t773)
  %t775 = load i64, ptr %local.mv.428
  %t776 = load i64, ptr %local.best_m.426
  %t777 = call i64 @"sx_f64_gt"(i64 %t775, i64 %t776)
  %t778 = icmp ne i64 %t777, 0
  br i1 %t778, label %then42, label %else42
then42:
  %t779 = load i64, ptr %local.mv.428
  store i64 %t779, ptr %local.best_m.426
  %t780 = load i64, ptr %local.e.424
  store i64 %t780, ptr %local.best_e.425
  %t781 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.69)
  %t782 = ptrtoint ptr %t781 to i64
  %t783 = inttoptr i64 %t782 to ptr
  call void @intrinsic_println(ptr %t783)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  %t784 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.70)
  %t785 = ptrtoint ptr %t784 to i64
  %t786 = inttoptr i64 %t785 to ptr
  call void @intrinsic_println(ptr %t786)
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t787 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t788 = load i64, ptr %local.e.424
  %t789 = call i64 @f64_parse(ptr @.str.exp_ns_full_hierarchy.71)
  %t790 = call i64 @"sx_f64_mul"(i64 %t788, i64 %t789)
  store i64 %t790, ptr %local.e.424
  %t791 = load i64, ptr %local.sw.427
  %t792 = add i64 %t791, 1
  store i64 %t792, ptr %local.sw.427
  br label %loop41
endloop41:
  %t793 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.72)
  %t794 = ptrtoint ptr %t793 to i64
  %t795 = inttoptr i64 %t794 to ptr
  call void @intrinsic_print(ptr %t795)
  %t796 = load i64, ptr %local.best_e.425
  %t797 = call i64 @"print_f64"(i64 %t796)
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.73)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_println(ptr %t800)
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.74)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.75)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.76)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.77)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  %t813 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.78)
  %t814 = ptrtoint ptr %t813 to i64
  %t815 = inttoptr i64 %t814 to ptr
  call void @intrinsic_print(ptr %t815)
  %t816 = load i64, ptr %local.detect_d2m.410
  call void @print_i64(i64 %t816)
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.79)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  %t820 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.80)
  %t821 = ptrtoint ptr %t820 to i64
  %t822 = inttoptr i64 %t821 to ptr
  call void @intrinsic_print(ptr %t822)
  %t823 = load i64, ptr %local.detect_dm.409
  call void @print_i64(i64 %t823)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.81)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_println(ptr %t826)
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.82)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_print(ptr %t829)
  %t830 = load i64, ptr %local.detect_m.408
  call void @print_i64(i64 %t830)
  %t831 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.83)
  %t832 = ptrtoint ptr %t831 to i64
  %t833 = inttoptr i64 %t832 to ptr
  call void @intrinsic_println(ptr %t833)
  %t834 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.84)
  %t835 = ptrtoint ptr %t834 to i64
  %t836 = inttoptr i64 %t835 to ptr
  call void @intrinsic_print(ptr %t836)
  %t837 = load i64, ptr %local.detect_spp.407
  call void @print_i64(i64 %t837)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.85)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_println(ptr %t840)
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.86)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_print(ptr %t843)
  %t844 = load i64, ptr %local.detect_sp.406
  call void @print_i64(i64 %t844)
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.87)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_println(ptr %t847)
  %t848 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.88)
  %t849 = ptrtoint ptr %t848 to i64
  %t850 = inttoptr i64 %t849 to ptr
  call void @intrinsic_print(ptr %t850)
  %t851 = load i64, ptr %local.detect_s.405
  call void @print_i64(i64 %t851)
  %t852 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.89)
  %t853 = ptrtoint ptr %t852 to i64
  %t854 = inttoptr i64 %t853 to ptr
  call void @intrinsic_println(ptr %t854)
  %t855 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.90)
  %t856 = ptrtoint ptr %t855 to i64
  %t857 = inttoptr i64 %t856 to ptr
  call void @intrinsic_print(ptr %t857)
  %t858 = load i64, ptr %local.detect_grad.411
  call void @print_i64(i64 %t858)
  %t859 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.91)
  %t860 = ptrtoint ptr %t859 to i64
  %t861 = inttoptr i64 %t860 to ptr
  call void @intrinsic_println(ptr %t861)
  %t862 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.92)
  %t863 = ptrtoint ptr %t862 to i64
  %t864 = inttoptr i64 %t863 to ptr
  call void @intrinsic_println(ptr %t864)
  %t865 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.93)
  %t866 = ptrtoint ptr %t865 to i64
  %t867 = inttoptr i64 %t866 to ptr
  call void @intrinsic_println(ptr %t867)
  %t868 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.94)
  %t869 = ptrtoint ptr %t868 to i64
  %t870 = inttoptr i64 %t869 to ptr
  call void @intrinsic_println(ptr %t870)
  %t871 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.95)
  %t872 = ptrtoint ptr %t871 to i64
  %t873 = inttoptr i64 %t872 to ptr
  call void @intrinsic_println(ptr %t873)
  %t874 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.96)
  %t875 = ptrtoint ptr %t874 to i64
  %t876 = inttoptr i64 %t875 to ptr
  call void @intrinsic_println(ptr %t876)
  %t877 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.97)
  %t878 = ptrtoint ptr %t877 to i64
  %t879 = inttoptr i64 %t878 to ptr
  call void @intrinsic_println(ptr %t879)
  %t880 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.98)
  %t881 = ptrtoint ptr %t880 to i64
  %t882 = inttoptr i64 %t881 to ptr
  call void @intrinsic_println(ptr %t882)
  %t883 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.99)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_println(ptr %t885)
  %t886 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.100)
  %t887 = ptrtoint ptr %t886 to i64
  %t888 = inttoptr i64 %t887 to ptr
  call void @intrinsic_println(ptr %t888)
  %t889 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.101)
  %t890 = ptrtoint ptr %t889 to i64
  %t891 = inttoptr i64 %t890 to ptr
  call void @intrinsic_println(ptr %t891)
  %t892 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.102)
  %t893 = ptrtoint ptr %t892 to i64
  %t894 = inttoptr i64 %t893 to ptr
  call void @intrinsic_println(ptr %t894)
  %t895 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.103)
  %t896 = ptrtoint ptr %t895 to i64
  %t897 = inttoptr i64 %t896 to ptr
  call void @intrinsic_println(ptr %t897)
  %t898 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.104)
  %t899 = ptrtoint ptr %t898 to i64
  %t900 = inttoptr i64 %t899 to ptr
  call void @intrinsic_println(ptr %t900)
  %t901 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.105)
  %t902 = ptrtoint ptr %t901 to i64
  %t903 = inttoptr i64 %t902 to ptr
  call void @intrinsic_println(ptr %t903)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_full_hierarchy.106)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  ret i64 0
}


; String constants
@.str.exp_ns_full_hierarchy.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_full_hierarchy.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_full_hierarchy.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.6 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_full_hierarchy.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_full_hierarchy.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_full_hierarchy.13 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_full_hierarchy.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.16 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_full_hierarchy.17 = private unnamed_addr constant [45 x i8] c"#  FULL 7-LEVEL HIERARCHY ON BURGERS       #\00"
@.str.exp_ns_full_hierarchy.18 = private unnamed_addr constant [46 x i8] c"#  10-point grid, all levels simultaneously #\00"
@.str.exp_ns_full_hierarchy.19 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_full_hierarchy.20 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.21 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_full_hierarchy.22 = private unnamed_addr constant [6 x i8] c"0.003\00"
@.str.exp_ns_full_hierarchy.23 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_full_hierarchy.24 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_full_hierarchy.25 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_full_hierarchy.26 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_full_hierarchy.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_full_hierarchy.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.33 = private unnamed_addr constant [95 x i8] c"  step    max|u|   max|grad|  I_ratio   S        S'       S''      M        dM/dt    d²M/dt²\00"
@.str.exp_ns_full_hierarchy.34 = private unnamed_addr constant [93 x i8] c"  ------  -------  ---------  --------  -------  -------  -------  -------  -------  -------\00"
@.str.exp_ns_full_hierarchy.35 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_full_hierarchy.36 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_full_hierarchy.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_full_hierarchy.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.41 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_full_hierarchy.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_full_hierarchy.44 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ns_full_hierarchy.45 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_full_hierarchy.46 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_full_hierarchy.47 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_full_hierarchy.48 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.49 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_full_hierarchy.50 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.51 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.52 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.53 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.54 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.55 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.56 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.57 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.60 = private unnamed_addr constant [41 x i8] c"  === Level 7: Optimal Probe Epsilon ===\00"
@.str.exp_ns_full_hierarchy.61 = private unnamed_addr constant [54 x i8] c"  At step 5000, which epsilon gives most information?\00"
@.str.exp_ns_full_hierarchy.62 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.63 = private unnamed_addr constant [41 x i8] c"  epsilon    M(eps)       interpretation\00"
@.str.exp_ns_full_hierarchy.64 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_full_hierarchy.65 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_full_hierarchy.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_full_hierarchy.67 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.68 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_full_hierarchy.69 = private unnamed_addr constant [9 x i8] c"  *best*\00"
@.str.exp_ns_full_hierarchy.70 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.71 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_full_hierarchy.72 = private unnamed_addr constant [16 x i8] c"  Optimal eps: \00"
@.str.exp_ns_full_hierarchy.73 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.74 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.75 = private unnamed_addr constant [52 x i8] c"  === DETECTION ORDER: Which level fires first? ===\00"
@.str.exp_ns_full_hierarchy.76 = private unnamed_addr constant [49 x i8] c"  (Step at which each diagnostic first triggers)\00"
@.str.exp_ns_full_hierarchy.77 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.78 = private unnamed_addr constant [27 x i8] c"  d²M/dt² > 0.01:  step \00"
@.str.exp_ns_full_hierarchy.79 = private unnamed_addr constant [39 x i8] c"  (Level 6 — fragility acceleration)\00"
@.str.exp_ns_full_hierarchy.80 = private unnamed_addr constant [26 x i8] c"  dM/dt > 0.05:     step \00"
@.str.exp_ns_full_hierarchy.81 = private unnamed_addr constant [33 x i8] c"  (Level 5 — fragility growth)\00"
@.str.exp_ns_full_hierarchy.82 = private unnamed_addr constant [26 x i8] c"  M > 1.5:          step \00"
@.str.exp_ns_full_hierarchy.83 = private unnamed_addr constant [31 x i8] c"  (Level 4 — high fragility)\00"
@.str.exp_ns_full_hierarchy.84 = private unnamed_addr constant [26 x i8] c"  S'' < -1.0:       step \00"
@.str.exp_ns_full_hierarchy.85 = private unnamed_addr constant [33 x i8] c"  (Level 3 — convergence jerk)\00"
@.str.exp_ns_full_hierarchy.86 = private unnamed_addr constant [26 x i8] c"  S' < -0.5:        step \00"
@.str.exp_ns_full_hierarchy.87 = private unnamed_addr constant [41 x i8] c"  (Level 3 — convergence deceleration)\00"
@.str.exp_ns_full_hierarchy.88 = private unnamed_addr constant [26 x i8] c"  S < 0:            step \00"
@.str.exp_ns_full_hierarchy.89 = private unnamed_addr constant [36 x i8] c"  (Level 2 — convergence failure)\00"
@.str.exp_ns_full_hierarchy.90 = private unnamed_addr constant [26 x i8] c"  max|grad| > 50:   step \00"
@.str.exp_ns_full_hierarchy.91 = private unnamed_addr constant [33 x i8] c"  (Level 0 — gradient blow-up)\00"
@.str.exp_ns_full_hierarchy.92 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.93 = private unnamed_addr constant [60 x i8] c"  The level that fires FIRST provides the earliest warning.\00"
@.str.exp_ns_full_hierarchy.94 = private unnamed_addr constant [60 x i8] c"  Higher levels (fragility acceleration) should fire before\00"
@.str.exp_ns_full_hierarchy.95 = private unnamed_addr constant [63 x i8] c"  lower levels (gradient blow-up) — confirming the hierarchy\00"
@.str.exp_ns_full_hierarchy.96 = private unnamed_addr constant [44 x i8] c"  provides progressively earlier detection.\00"
@.str.exp_ns_full_hierarchy.97 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_full_hierarchy.98 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_full_hierarchy.99 = private unnamed_addr constant [45 x i8] c"#  COMPLETE 7-LEVEL HIERARCHY DEMONSTRATED #\00"
@.str.exp_ns_full_hierarchy.100 = private unnamed_addr constant [45 x i8] c"#  ON NAVIER-STOKES BURGERS EQUATION       #\00"
@.str.exp_ns_full_hierarchy.101 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_full_hierarchy.102 = private unnamed_addr constant [45 x i8] c"#  The skeptical agent probes, measures,   #\00"
@.str.exp_ns_full_hierarchy.103 = private unnamed_addr constant [45 x i8] c"#  predicts, and identifies the mechanism  #\00"
@.str.exp_ns_full_hierarchy.104 = private unnamed_addr constant [47 x i8] c"#  of instability — all in a single        #\00"
@.str.exp_ns_full_hierarchy.105 = private unnamed_addr constant [45 x i8] c"#  forward pass through dual numbers.      #\00"
@.str.exp_ns_full_hierarchy.106 = private unnamed_addr constant [45 x i8] c"############################################\00"
