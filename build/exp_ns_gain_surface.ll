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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"step6"(i64 %u0, i64 %u1, i64 %u2, i64 %w0, i64 %w1, i64 %w2, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.32 = alloca i64
  %local.du0.33 = alloca i64
  %local.du1.34 = alloca i64
  %local.du2.35 = alloca i64
  %local.dw0.36 = alloca i64
  %local.dw1.37 = alloca i64
  %local.dw2.38 = alloca i64
  %local.su0.39 = alloca i64
  %local.su1.40 = alloca i64
  %local.su2.41 = alloca i64
  %local.vw0.42 = alloca i64
  %local.vw1.43 = alloca i64
  %local.vw2.44 = alloca i64
  %local.qw0.45 = alloca i64
  %local.qw1.46 = alloca i64
  %local.qw2.47 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t48 = load i64, ptr %local.w0
  %t49 = load i64, ptr %local.w0
  %t50 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t49)
  %t51 = load i64, ptr %local.w1
  %t52 = load i64, ptr %local.w1
  %t53 = call i64 @"sx_f64_mul"(i64 %t51, i64 %t52)
  %t54 = call i64 @"sx_f64_add"(i64 %t50, i64 %t53)
  %t55 = load i64, ptr %local.w2
  %t56 = load i64, ptr %local.w2
  %t57 = call i64 @"sx_f64_mul"(i64 %t55, i64 %t56)
  %t58 = call i64 @"sx_f64_add"(i64 %t54, i64 %t57)
  store i64 %t58, ptr %local.omega_sq.32
  %t59 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.5)
  %t60 = load i64, ptr %local.nu
  %t61 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.6)
  %t62 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t61)
  %t63 = load i64, ptr %local.u0
  %t64 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t63)
  %t65 = call i64 @"sx_f64_sub"(i64 %t59, i64 %t64)
  store i64 %t65, ptr %local.du0.33
  %t66 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.7)
  %t67 = load i64, ptr %local.nu
  %t68 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.8)
  %t69 = call i64 @"sx_f64_mul"(i64 %t67, i64 %t68)
  %t70 = load i64, ptr %local.u1
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  %t72 = call i64 @"sx_f64_sub"(i64 %t66, i64 %t71)
  store i64 %t72, ptr %local.du1.34
  %t73 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.9)
  %t74 = load i64, ptr %local.nu
  %t75 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.10)
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = load i64, ptr %local.u2
  %t78 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t77)
  %t79 = call i64 @"sx_f64_sub"(i64 %t73, i64 %t78)
  store i64 %t79, ptr %local.du2.35
  %t80 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.11)
  %t81 = load i64, ptr %local.nu
  %t82 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.12)
  %t83 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t82)
  %t84 = load i64, ptr %local.w0
  %t85 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t85)
  store i64 %t86, ptr %local.dw0.36
  %t87 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.13)
  %t88 = load i64, ptr %local.nu
  %t89 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.14)
  %t90 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t89)
  %t91 = load i64, ptr %local.w1
  %t92 = call i64 @"sx_f64_mul"(i64 %t90, i64 %t91)
  %t93 = call i64 @"sx_f64_sub"(i64 %t87, i64 %t92)
  store i64 %t93, ptr %local.dw1.37
  %t94 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.15)
  %t95 = load i64, ptr %local.nu
  %t96 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.16)
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = load i64, ptr %local.w2
  %t99 = call i64 @"sx_f64_mul"(i64 %t97, i64 %t98)
  %t100 = call i64 @"sx_f64_sub"(i64 %t94, i64 %t99)
  store i64 %t100, ptr %local.dw2.38
  %t101 = load i64, ptr %local.sigma
  %t102 = load i64, ptr %local.w1
  %t103 = load i64, ptr %local.u2
  %t104 = call i64 @"sx_f64_mul"(i64 %t102, i64 %t103)
  %t105 = load i64, ptr %local.w2
  %t106 = load i64, ptr %local.u1
  %t107 = call i64 @"sx_f64_mul"(i64 %t105, i64 %t106)
  %t108 = call i64 @"sx_f64_sub"(i64 %t104, i64 %t107)
  %t109 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t108)
  store i64 %t109, ptr %local.su0.39
  %t110 = load i64, ptr %local.sigma
  %t111 = load i64, ptr %local.w2
  %t112 = load i64, ptr %local.u0
  %t113 = call i64 @"sx_f64_mul"(i64 %t111, i64 %t112)
  %t114 = load i64, ptr %local.w0
  %t115 = load i64, ptr %local.u2
  %t116 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t115)
  %t117 = call i64 @"sx_f64_sub"(i64 %t113, i64 %t116)
  %t118 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t117)
  store i64 %t118, ptr %local.su1.40
  %t119 = load i64, ptr %local.sigma
  %t120 = load i64, ptr %local.w0
  %t121 = load i64, ptr %local.u1
  %t122 = call i64 @"sx_f64_mul"(i64 %t120, i64 %t121)
  %t123 = load i64, ptr %local.w1
  %t124 = load i64, ptr %local.u0
  %t125 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t124)
  %t126 = call i64 @"sx_f64_sub"(i64 %t122, i64 %t125)
  %t127 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t126)
  store i64 %t127, ptr %local.su2.41
  %t128 = load i64, ptr %local.lambda
  %t129 = load i64, ptr %local.w1
  %t130 = load i64, ptr %local.u2
  %t131 = call i64 @"sx_f64_mul"(i64 %t129, i64 %t130)
  %t132 = load i64, ptr %local.w2
  %t133 = load i64, ptr %local.u1
  %t134 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sx_f64_add"(i64 %t131, i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t135)
  store i64 %t136, ptr %local.vw0.42
  %t137 = load i64, ptr %local.lambda
  %t138 = load i64, ptr %local.w2
  %t139 = load i64, ptr %local.u0
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = load i64, ptr %local.w0
  %t142 = load i64, ptr %local.u2
  %t143 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_add"(i64 %t140, i64 %t143)
  %t145 = call i64 @"sx_f64_mul"(i64 %t137, i64 %t144)
  store i64 %t145, ptr %local.vw1.43
  %t146 = load i64, ptr %local.lambda
  %t147 = load i64, ptr %local.w0
  %t148 = load i64, ptr %local.u1
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = load i64, ptr %local.w1
  %t151 = load i64, ptr %local.u0
  %t152 = call i64 @"sx_f64_mul"(i64 %t150, i64 %t151)
  %t153 = call i64 @"sx_f64_add"(i64 %t149, i64 %t152)
  %t154 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t153)
  store i64 %t154, ptr %local.vw2.44
  %t155 = load i64, ptr %local.lambda2
  %t156 = load i64, ptr %local.omega_sq.32
  %t157 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t156)
  %t158 = load i64, ptr %local.w0
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  store i64 %t159, ptr %local.qw0.45
  %t160 = load i64, ptr %local.lambda2
  %t161 = load i64, ptr %local.omega_sq.32
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = load i64, ptr %local.w1
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  store i64 %t164, ptr %local.qw1.46
  %t165 = load i64, ptr %local.lambda2
  %t166 = load i64, ptr %local.omega_sq.32
  %t167 = call i64 @"sx_f64_mul"(i64 %t165, i64 %t166)
  %t168 = load i64, ptr %local.w2
  %t169 = call i64 @"sx_f64_mul"(i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.qw2.47
  %t170 = load i64, ptr %local.which
  %t171 = icmp eq i64 %t170, 0
  %t172 = zext i1 %t171 to i64
  %t173 = icmp ne i64 %t172, 0
  br i1 %t173, label %then3, label %else3
then3:
  %t174 = load i64, ptr %local.u0
  %t175 = load i64, ptr %local.dt
  %t176 = load i64, ptr %local.du0.33
  %t177 = load i64, ptr %local.su0.39
  %t178 = call i64 @"sx_f64_add"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t178)
  %t180 = call i64 @"sx_f64_add"(i64 %t174, i64 %t179)
  ret i64 %t180
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t181 = phi i64 [ 0, %else3_end ]
  %t182 = load i64, ptr %local.which
  %t183 = icmp eq i64 %t182, 1
  %t184 = zext i1 %t183 to i64
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %then4, label %else4
then4:
  %t186 = load i64, ptr %local.u1
  %t187 = load i64, ptr %local.dt
  %t188 = load i64, ptr %local.du1.34
  %t189 = load i64, ptr %local.su1.40
  %t190 = call i64 @"sx_f64_add"(i64 %t188, i64 %t189)
  %t191 = call i64 @"sx_f64_mul"(i64 %t187, i64 %t190)
  %t192 = call i64 @"sx_f64_add"(i64 %t186, i64 %t191)
  ret i64 %t192
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t193 = phi i64 [ 0, %else4_end ]
  %t194 = load i64, ptr %local.which
  %t195 = icmp eq i64 %t194, 2
  %t196 = zext i1 %t195 to i64
  %t197 = icmp ne i64 %t196, 0
  br i1 %t197, label %then5, label %else5
then5:
  %t198 = load i64, ptr %local.u2
  %t199 = load i64, ptr %local.dt
  %t200 = load i64, ptr %local.du2.35
  %t201 = load i64, ptr %local.su2.41
  %t202 = call i64 @"sx_f64_add"(i64 %t200, i64 %t201)
  %t203 = call i64 @"sx_f64_mul"(i64 %t199, i64 %t202)
  %t204 = call i64 @"sx_f64_add"(i64 %t198, i64 %t203)
  ret i64 %t204
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t205 = phi i64 [ 0, %else5_end ]
  %t206 = load i64, ptr %local.which
  %t207 = icmp eq i64 %t206, 3
  %t208 = zext i1 %t207 to i64
  %t209 = icmp ne i64 %t208, 0
  br i1 %t209, label %then6, label %else6
then6:
  %t210 = load i64, ptr %local.w0
  %t211 = load i64, ptr %local.dt
  %t212 = load i64, ptr %local.dw0.36
  %t213 = load i64, ptr %local.vw0.42
  %t214 = call i64 @"sx_f64_add"(i64 %t212, i64 %t213)
  %t215 = load i64, ptr %local.qw0.45
  %t216 = call i64 @"sx_f64_add"(i64 %t214, i64 %t215)
  %t217 = call i64 @"sx_f64_mul"(i64 %t211, i64 %t216)
  %t218 = call i64 @"sx_f64_add"(i64 %t210, i64 %t217)
  ret i64 %t218
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t219 = phi i64 [ 0, %else6_end ]
  %t220 = load i64, ptr %local.which
  %t221 = icmp eq i64 %t220, 4
  %t222 = zext i1 %t221 to i64
  %t223 = icmp ne i64 %t222, 0
  br i1 %t223, label %then7, label %else7
then7:
  %t224 = load i64, ptr %local.w1
  %t225 = load i64, ptr %local.dt
  %t226 = load i64, ptr %local.dw1.37
  %t227 = load i64, ptr %local.vw1.43
  %t228 = call i64 @"sx_f64_add"(i64 %t226, i64 %t227)
  %t229 = load i64, ptr %local.qw1.46
  %t230 = call i64 @"sx_f64_add"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_mul"(i64 %t225, i64 %t230)
  %t232 = call i64 @"sx_f64_add"(i64 %t224, i64 %t231)
  ret i64 %t232
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t233 = phi i64 [ 0, %else7_end ]
  %t234 = load i64, ptr %local.w2
  %t235 = load i64, ptr %local.dt
  %t236 = load i64, ptr %local.dw2.38
  %t237 = load i64, ptr %local.vw2.44
  %t238 = call i64 @"sx_f64_add"(i64 %t236, i64 %t237)
  %t239 = load i64, ptr %local.qw2.47
  %t240 = call i64 @"sx_f64_add"(i64 %t238, i64 %t239)
  %t241 = call i64 @"sx_f64_mul"(i64 %t235, i64 %t240)
  %t242 = call i64 @"sx_f64_add"(i64 %t234, i64 %t241)
  ret i64 %t242
}

define i64 @"step8"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.243 = alloca i64
  %local.du0.244 = alloca i64
  %local.du1.245 = alloca i64
  %local.du2.246 = alloca i64
  %local.du3.247 = alloca i64
  %local.dw0.248 = alloca i64
  %local.dw1.249 = alloca i64
  %local.dw2.250 = alloca i64
  %local.dw3.251 = alloca i64
  %local.su0.252 = alloca i64
  %local.su1.253 = alloca i64
  %local.su2.254 = alloca i64
  %local.su3.255 = alloca i64
  %local.vw0.256 = alloca i64
  %local.vw1.257 = alloca i64
  %local.vw2.258 = alloca i64
  %local.vw3.259 = alloca i64
  %local.qw0.260 = alloca i64
  %local.qw1.261 = alloca i64
  %local.qw2.262 = alloca i64
  %local.qw3.263 = alloca i64
  %local.c_w2.264 = alloca i64
  %local.c_w3.265 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t266 = load i64, ptr %local.w0
  %t267 = load i64, ptr %local.w0
  %t268 = call i64 @"sx_f64_mul"(i64 %t266, i64 %t267)
  %t269 = load i64, ptr %local.w1
  %t270 = load i64, ptr %local.w1
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_add"(i64 %t268, i64 %t271)
  %t273 = load i64, ptr %local.w2
  %t274 = load i64, ptr %local.w2
  %t275 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t274)
  %t276 = call i64 @"sx_f64_add"(i64 %t272, i64 %t275)
  %t277 = load i64, ptr %local.w3
  %t278 = load i64, ptr %local.w3
  %t279 = call i64 @"sx_f64_mul"(i64 %t277, i64 %t278)
  %t280 = call i64 @"sx_f64_add"(i64 %t276, i64 %t279)
  store i64 %t280, ptr %local.omega_sq.243
  %t281 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.17)
  %t282 = load i64, ptr %local.nu
  %t283 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.18)
  %t284 = call i64 @"sx_f64_mul"(i64 %t282, i64 %t283)
  %t285 = load i64, ptr %local.u0
  %t286 = call i64 @"sx_f64_mul"(i64 %t284, i64 %t285)
  %t287 = call i64 @"sx_f64_sub"(i64 %t281, i64 %t286)
  store i64 %t287, ptr %local.du0.244
  %t288 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.19)
  %t289 = load i64, ptr %local.nu
  %t290 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.20)
  %t291 = call i64 @"sx_f64_mul"(i64 %t289, i64 %t290)
  %t292 = load i64, ptr %local.u1
  %t293 = call i64 @"sx_f64_mul"(i64 %t291, i64 %t292)
  %t294 = call i64 @"sx_f64_sub"(i64 %t288, i64 %t293)
  store i64 %t294, ptr %local.du1.245
  %t295 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.21)
  %t296 = load i64, ptr %local.nu
  %t297 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.22)
  %t298 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t297)
  %t299 = load i64, ptr %local.u2
  %t300 = call i64 @"sx_f64_mul"(i64 %t298, i64 %t299)
  %t301 = call i64 @"sx_f64_sub"(i64 %t295, i64 %t300)
  store i64 %t301, ptr %local.du2.246
  %t302 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.23)
  %t303 = load i64, ptr %local.nu
  %t304 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.24)
  %t305 = call i64 @"sx_f64_mul"(i64 %t303, i64 %t304)
  %t306 = load i64, ptr %local.u3
  %t307 = call i64 @"sx_f64_mul"(i64 %t305, i64 %t306)
  %t308 = call i64 @"sx_f64_sub"(i64 %t302, i64 %t307)
  store i64 %t308, ptr %local.du3.247
  %t309 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.25)
  %t310 = load i64, ptr %local.nu
  %t311 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.26)
  %t312 = call i64 @"sx_f64_mul"(i64 %t310, i64 %t311)
  %t313 = load i64, ptr %local.w0
  %t314 = call i64 @"sx_f64_mul"(i64 %t312, i64 %t313)
  %t315 = call i64 @"sx_f64_sub"(i64 %t309, i64 %t314)
  store i64 %t315, ptr %local.dw0.248
  %t316 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.27)
  %t317 = load i64, ptr %local.nu
  %t318 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.28)
  %t319 = call i64 @"sx_f64_mul"(i64 %t317, i64 %t318)
  %t320 = load i64, ptr %local.w1
  %t321 = call i64 @"sx_f64_mul"(i64 %t319, i64 %t320)
  %t322 = call i64 @"sx_f64_sub"(i64 %t316, i64 %t321)
  store i64 %t322, ptr %local.dw1.249
  %t323 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.29)
  %t324 = load i64, ptr %local.nu
  %t325 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.30)
  %t326 = call i64 @"sx_f64_mul"(i64 %t324, i64 %t325)
  %t327 = load i64, ptr %local.w2
  %t328 = call i64 @"sx_f64_mul"(i64 %t326, i64 %t327)
  %t329 = call i64 @"sx_f64_sub"(i64 %t323, i64 %t328)
  store i64 %t329, ptr %local.dw2.250
  %t330 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.31)
  %t331 = load i64, ptr %local.nu
  %t332 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.32)
  %t333 = call i64 @"sx_f64_mul"(i64 %t331, i64 %t332)
  %t334 = load i64, ptr %local.w3
  %t335 = call i64 @"sx_f64_mul"(i64 %t333, i64 %t334)
  %t336 = call i64 @"sx_f64_sub"(i64 %t330, i64 %t335)
  store i64 %t336, ptr %local.dw3.251
  %t337 = load i64, ptr %local.sigma
  %t338 = load i64, ptr %local.w0
  %t339 = load i64, ptr %local.u1
  %t340 = call i64 @"sx_f64_mul"(i64 %t338, i64 %t339)
  %t341 = load i64, ptr %local.w1
  %t342 = load i64, ptr %local.u0
  %t343 = call i64 @"sx_f64_mul"(i64 %t341, i64 %t342)
  %t344 = call i64 @"sx_f64_sub"(i64 %t340, i64 %t343)
  %t345 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t344)
  store i64 %t345, ptr %local.su0.252
  %t346 = load i64, ptr %local.sigma
  %t347 = load i64, ptr %local.w1
  %t348 = load i64, ptr %local.u0
  %t349 = call i64 @"sx_f64_mul"(i64 %t347, i64 %t348)
  %t350 = load i64, ptr %local.w0
  %t351 = load i64, ptr %local.u1
  %t352 = call i64 @"sx_f64_mul"(i64 %t350, i64 %t351)
  %t353 = call i64 @"sx_f64_sub"(i64 %t349, i64 %t352)
  %t354 = call i64 @"sx_f64_mul"(i64 %t346, i64 %t353)
  store i64 %t354, ptr %local.su1.253
  %t355 = load i64, ptr %local.sigma
  %t356 = load i64, ptr %local.w2
  %t357 = load i64, ptr %local.u3
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = load i64, ptr %local.w3
  %t360 = load i64, ptr %local.u2
  %t361 = call i64 @"sx_f64_mul"(i64 %t359, i64 %t360)
  %t362 = call i64 @"sx_f64_sub"(i64 %t358, i64 %t361)
  %t363 = call i64 @"sx_f64_mul"(i64 %t355, i64 %t362)
  store i64 %t363, ptr %local.su2.254
  %t364 = load i64, ptr %local.sigma
  %t365 = load i64, ptr %local.w3
  %t366 = load i64, ptr %local.u2
  %t367 = call i64 @"sx_f64_mul"(i64 %t365, i64 %t366)
  %t368 = load i64, ptr %local.w2
  %t369 = load i64, ptr %local.u3
  %t370 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t369)
  %t371 = call i64 @"sx_f64_sub"(i64 %t367, i64 %t370)
  %t372 = call i64 @"sx_f64_mul"(i64 %t364, i64 %t371)
  store i64 %t372, ptr %local.su3.255
  %t373 = load i64, ptr %local.lambda
  %t374 = load i64, ptr %local.w1
  %t375 = load i64, ptr %local.u0
  %t376 = call i64 @"sx_f64_mul"(i64 %t374, i64 %t375)
  %t377 = load i64, ptr %local.w0
  %t378 = load i64, ptr %local.u1
  %t379 = call i64 @"sx_f64_mul"(i64 %t377, i64 %t378)
  %t380 = call i64 @"sx_f64_add"(i64 %t376, i64 %t379)
  %t381 = call i64 @"sx_f64_mul"(i64 %t373, i64 %t380)
  store i64 %t381, ptr %local.vw0.256
  %t382 = load i64, ptr %local.lambda
  %t383 = load i64, ptr %local.w0
  %t384 = load i64, ptr %local.u1
  %t385 = call i64 @"sx_f64_mul"(i64 %t383, i64 %t384)
  %t386 = load i64, ptr %local.w1
  %t387 = load i64, ptr %local.u0
  %t388 = call i64 @"sx_f64_mul"(i64 %t386, i64 %t387)
  %t389 = call i64 @"sx_f64_add"(i64 %t385, i64 %t388)
  %t390 = call i64 @"sx_f64_mul"(i64 %t382, i64 %t389)
  store i64 %t390, ptr %local.vw1.257
  %t391 = load i64, ptr %local.lambda
  %t392 = load i64, ptr %local.w3
  %t393 = load i64, ptr %local.u2
  %t394 = call i64 @"sx_f64_mul"(i64 %t392, i64 %t393)
  %t395 = load i64, ptr %local.w2
  %t396 = load i64, ptr %local.u3
  %t397 = call i64 @"sx_f64_mul"(i64 %t395, i64 %t396)
  %t398 = call i64 @"sx_f64_add"(i64 %t394, i64 %t397)
  %t399 = call i64 @"sx_f64_mul"(i64 %t391, i64 %t398)
  store i64 %t399, ptr %local.vw2.258
  %t400 = load i64, ptr %local.lambda
  %t401 = load i64, ptr %local.w2
  %t402 = load i64, ptr %local.u3
  %t403 = call i64 @"sx_f64_mul"(i64 %t401, i64 %t402)
  %t404 = load i64, ptr %local.w3
  %t405 = load i64, ptr %local.u2
  %t406 = call i64 @"sx_f64_mul"(i64 %t404, i64 %t405)
  %t407 = call i64 @"sx_f64_add"(i64 %t403, i64 %t406)
  %t408 = call i64 @"sx_f64_mul"(i64 %t400, i64 %t407)
  store i64 %t408, ptr %local.vw3.259
  %t409 = load i64, ptr %local.lambda2
  %t410 = load i64, ptr %local.omega_sq.243
  %t411 = call i64 @"sx_f64_mul"(i64 %t409, i64 %t410)
  %t412 = load i64, ptr %local.w0
  %t413 = call i64 @"sx_f64_mul"(i64 %t411, i64 %t412)
  store i64 %t413, ptr %local.qw0.260
  %t414 = load i64, ptr %local.lambda2
  %t415 = load i64, ptr %local.omega_sq.243
  %t416 = call i64 @"sx_f64_mul"(i64 %t414, i64 %t415)
  %t417 = load i64, ptr %local.w1
  %t418 = call i64 @"sx_f64_mul"(i64 %t416, i64 %t417)
  store i64 %t418, ptr %local.qw1.261
  %t419 = load i64, ptr %local.lambda2
  %t420 = load i64, ptr %local.omega_sq.243
  %t421 = call i64 @"sx_f64_mul"(i64 %t419, i64 %t420)
  %t422 = load i64, ptr %local.w2
  %t423 = call i64 @"sx_f64_mul"(i64 %t421, i64 %t422)
  store i64 %t423, ptr %local.qw2.262
  %t424 = load i64, ptr %local.lambda2
  %t425 = load i64, ptr %local.omega_sq.243
  %t426 = call i64 @"sx_f64_mul"(i64 %t424, i64 %t425)
  %t427 = load i64, ptr %local.w3
  %t428 = call i64 @"sx_f64_mul"(i64 %t426, i64 %t427)
  store i64 %t428, ptr %local.qw3.263
  %t429 = load i64, ptr %local.beta
  %t430 = load i64, ptr %local.w0
  %t431 = call i64 @"sx_f64_mul"(i64 %t429, i64 %t430)
  %t432 = load i64, ptr %local.w1
  %t433 = call i64 @"sx_f64_mul"(i64 %t431, i64 %t432)
  store i64 %t433, ptr %local.c_w2.264
  %t434 = load i64, ptr %local.beta
  %t435 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.33)
  %t436 = load i64, ptr %local.w0
  %t437 = load i64, ptr %local.w1
  %t438 = call i64 @"sx_f64_mul"(i64 %t436, i64 %t437)
  %t439 = call i64 @"sx_f64_sub"(i64 %t435, i64 %t438)
  %t440 = call i64 @"sx_f64_mul"(i64 %t434, i64 %t439)
  store i64 %t440, ptr %local.c_w3.265
  %t441 = load i64, ptr %local.which
  %t442 = icmp eq i64 %t441, 0
  %t443 = zext i1 %t442 to i64
  %t444 = icmp ne i64 %t443, 0
  br i1 %t444, label %then8, label %else8
then8:
  %t445 = load i64, ptr %local.u0
  %t446 = load i64, ptr %local.dt
  %t447 = load i64, ptr %local.du0.244
  %t448 = load i64, ptr %local.su0.252
  %t449 = call i64 @"sx_f64_add"(i64 %t447, i64 %t448)
  %t450 = call i64 @"sx_f64_mul"(i64 %t446, i64 %t449)
  %t451 = call i64 @"sx_f64_add"(i64 %t445, i64 %t450)
  ret i64 %t451
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t452 = phi i64 [ 0, %else8_end ]
  %t453 = load i64, ptr %local.which
  %t454 = icmp eq i64 %t453, 1
  %t455 = zext i1 %t454 to i64
  %t456 = icmp ne i64 %t455, 0
  br i1 %t456, label %then9, label %else9
then9:
  %t457 = load i64, ptr %local.u1
  %t458 = load i64, ptr %local.dt
  %t459 = load i64, ptr %local.du1.245
  %t460 = load i64, ptr %local.su1.253
  %t461 = call i64 @"sx_f64_add"(i64 %t459, i64 %t460)
  %t462 = call i64 @"sx_f64_mul"(i64 %t458, i64 %t461)
  %t463 = call i64 @"sx_f64_add"(i64 %t457, i64 %t462)
  ret i64 %t463
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t464 = phi i64 [ 0, %else9_end ]
  %t465 = load i64, ptr %local.which
  %t466 = icmp eq i64 %t465, 2
  %t467 = zext i1 %t466 to i64
  %t468 = icmp ne i64 %t467, 0
  br i1 %t468, label %then10, label %else10
then10:
  %t469 = load i64, ptr %local.u2
  %t470 = load i64, ptr %local.dt
  %t471 = load i64, ptr %local.du2.246
  %t472 = load i64, ptr %local.su2.254
  %t473 = call i64 @"sx_f64_add"(i64 %t471, i64 %t472)
  %t474 = call i64 @"sx_f64_mul"(i64 %t470, i64 %t473)
  %t475 = call i64 @"sx_f64_add"(i64 %t469, i64 %t474)
  ret i64 %t475
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t476 = phi i64 [ 0, %else10_end ]
  %t477 = load i64, ptr %local.which
  %t478 = icmp eq i64 %t477, 3
  %t479 = zext i1 %t478 to i64
  %t480 = icmp ne i64 %t479, 0
  br i1 %t480, label %then11, label %else11
then11:
  %t481 = load i64, ptr %local.u3
  %t482 = load i64, ptr %local.dt
  %t483 = load i64, ptr %local.du3.247
  %t484 = load i64, ptr %local.su3.255
  %t485 = call i64 @"sx_f64_add"(i64 %t483, i64 %t484)
  %t486 = call i64 @"sx_f64_mul"(i64 %t482, i64 %t485)
  %t487 = call i64 @"sx_f64_add"(i64 %t481, i64 %t486)
  ret i64 %t487
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t488 = phi i64 [ 0, %else11_end ]
  %t489 = load i64, ptr %local.which
  %t490 = icmp eq i64 %t489, 4
  %t491 = zext i1 %t490 to i64
  %t492 = icmp ne i64 %t491, 0
  br i1 %t492, label %then12, label %else12
then12:
  %t493 = load i64, ptr %local.w0
  %t494 = load i64, ptr %local.dt
  %t495 = load i64, ptr %local.dw0.248
  %t496 = load i64, ptr %local.vw0.256
  %t497 = call i64 @"sx_f64_add"(i64 %t495, i64 %t496)
  %t498 = load i64, ptr %local.qw0.260
  %t499 = call i64 @"sx_f64_add"(i64 %t497, i64 %t498)
  %t500 = call i64 @"sx_f64_mul"(i64 %t494, i64 %t499)
  %t501 = call i64 @"sx_f64_add"(i64 %t493, i64 %t500)
  ret i64 %t501
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t502 = phi i64 [ 0, %else12_end ]
  %t503 = load i64, ptr %local.which
  %t504 = icmp eq i64 %t503, 5
  %t505 = zext i1 %t504 to i64
  %t506 = icmp ne i64 %t505, 0
  br i1 %t506, label %then13, label %else13
then13:
  %t507 = load i64, ptr %local.w1
  %t508 = load i64, ptr %local.dt
  %t509 = load i64, ptr %local.dw1.249
  %t510 = load i64, ptr %local.vw1.257
  %t511 = call i64 @"sx_f64_add"(i64 %t509, i64 %t510)
  %t512 = load i64, ptr %local.qw1.261
  %t513 = call i64 @"sx_f64_add"(i64 %t511, i64 %t512)
  %t514 = call i64 @"sx_f64_mul"(i64 %t508, i64 %t513)
  %t515 = call i64 @"sx_f64_add"(i64 %t507, i64 %t514)
  ret i64 %t515
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t516 = phi i64 [ 0, %else13_end ]
  %t517 = load i64, ptr %local.which
  %t518 = icmp eq i64 %t517, 6
  %t519 = zext i1 %t518 to i64
  %t520 = icmp ne i64 %t519, 0
  br i1 %t520, label %then14, label %else14
then14:
  %t521 = load i64, ptr %local.w2
  %t522 = load i64, ptr %local.dt
  %t523 = load i64, ptr %local.dw2.250
  %t524 = load i64, ptr %local.vw2.258
  %t525 = call i64 @"sx_f64_add"(i64 %t523, i64 %t524)
  %t526 = load i64, ptr %local.qw2.262
  %t527 = call i64 @"sx_f64_add"(i64 %t525, i64 %t526)
  %t528 = load i64, ptr %local.c_w2.264
  %t529 = call i64 @"sx_f64_add"(i64 %t527, i64 %t528)
  %t530 = call i64 @"sx_f64_mul"(i64 %t522, i64 %t529)
  %t531 = call i64 @"sx_f64_add"(i64 %t521, i64 %t530)
  ret i64 %t531
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t532 = phi i64 [ 0, %else14_end ]
  %t533 = load i64, ptr %local.w3
  %t534 = load i64, ptr %local.dt
  %t535 = load i64, ptr %local.dw3.251
  %t536 = load i64, ptr %local.vw3.259
  %t537 = call i64 @"sx_f64_add"(i64 %t535, i64 %t536)
  %t538 = load i64, ptr %local.qw3.263
  %t539 = call i64 @"sx_f64_add"(i64 %t537, i64 %t538)
  %t540 = load i64, ptr %local.c_w3.265
  %t541 = call i64 @"sx_f64_add"(i64 %t539, i64 %t540)
  %t542 = call i64 @"sx_f64_mul"(i64 %t534, i64 %t541)
  %t543 = call i64 @"sx_f64_add"(i64 %t533, i64 %t542)
  ret i64 %t543
}

define i64 @"step10"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.544 = alloca i64
  %local.du0.545 = alloca i64
  %local.du1.546 = alloca i64
  %local.du2.547 = alloca i64
  %local.du3.548 = alloca i64
  %local.du4.549 = alloca i64
  %local.dw0.550 = alloca i64
  %local.dw1.551 = alloca i64
  %local.dw2.552 = alloca i64
  %local.dw3.553 = alloca i64
  %local.dw4.554 = alloca i64
  %local.su0.555 = alloca i64
  %local.su1.556 = alloca i64
  %local.su2.557 = alloca i64
  %local.su3.558 = alloca i64
  %local.su4.559 = alloca i64
  %local.vw0.560 = alloca i64
  %local.vw1.561 = alloca i64
  %local.vw2.562 = alloca i64
  %local.vw3.563 = alloca i64
  %local.vw4.564 = alloca i64
  %local.qw0.565 = alloca i64
  %local.qw1.566 = alloca i64
  %local.qw2.567 = alloca i64
  %local.qw3.568 = alloca i64
  %local.qw4.569 = alloca i64
  %local.c_w2.570 = alloca i64
  %local.c_w3.571 = alloca i64
  %local.c_w4.572 = alloca i64
  %local.t_w4.573 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t574 = load i64, ptr %local.w0
  %t575 = load i64, ptr %local.w0
  %t576 = call i64 @"sx_f64_mul"(i64 %t574, i64 %t575)
  %t577 = load i64, ptr %local.w1
  %t578 = load i64, ptr %local.w1
  %t579 = call i64 @"sx_f64_mul"(i64 %t577, i64 %t578)
  %t580 = call i64 @"sx_f64_add"(i64 %t576, i64 %t579)
  %t581 = load i64, ptr %local.w2
  %t582 = load i64, ptr %local.w2
  %t583 = call i64 @"sx_f64_mul"(i64 %t581, i64 %t582)
  %t584 = call i64 @"sx_f64_add"(i64 %t580, i64 %t583)
  %t585 = load i64, ptr %local.w3
  %t586 = load i64, ptr %local.w3
  %t587 = call i64 @"sx_f64_mul"(i64 %t585, i64 %t586)
  %t588 = call i64 @"sx_f64_add"(i64 %t584, i64 %t587)
  %t589 = load i64, ptr %local.w4
  %t590 = load i64, ptr %local.w4
  %t591 = call i64 @"sx_f64_mul"(i64 %t589, i64 %t590)
  %t592 = call i64 @"sx_f64_add"(i64 %t588, i64 %t591)
  store i64 %t592, ptr %local.omega_sq.544
  %t593 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.34)
  %t594 = load i64, ptr %local.nu
  %t595 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.35)
  %t596 = call i64 @"sx_f64_mul"(i64 %t594, i64 %t595)
  %t597 = load i64, ptr %local.u0
  %t598 = call i64 @"sx_f64_mul"(i64 %t596, i64 %t597)
  %t599 = call i64 @"sx_f64_sub"(i64 %t593, i64 %t598)
  store i64 %t599, ptr %local.du0.545
  %t600 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.36)
  %t601 = load i64, ptr %local.nu
  %t602 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.37)
  %t603 = call i64 @"sx_f64_mul"(i64 %t601, i64 %t602)
  %t604 = load i64, ptr %local.u1
  %t605 = call i64 @"sx_f64_mul"(i64 %t603, i64 %t604)
  %t606 = call i64 @"sx_f64_sub"(i64 %t600, i64 %t605)
  store i64 %t606, ptr %local.du1.546
  %t607 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.38)
  %t608 = load i64, ptr %local.nu
  %t609 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.39)
  %t610 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t609)
  %t611 = load i64, ptr %local.u2
  %t612 = call i64 @"sx_f64_mul"(i64 %t610, i64 %t611)
  %t613 = call i64 @"sx_f64_sub"(i64 %t607, i64 %t612)
  store i64 %t613, ptr %local.du2.547
  %t614 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.40)
  %t615 = load i64, ptr %local.nu
  %t616 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.41)
  %t617 = call i64 @"sx_f64_mul"(i64 %t615, i64 %t616)
  %t618 = load i64, ptr %local.u3
  %t619 = call i64 @"sx_f64_mul"(i64 %t617, i64 %t618)
  %t620 = call i64 @"sx_f64_sub"(i64 %t614, i64 %t619)
  store i64 %t620, ptr %local.du3.548
  %t621 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.42)
  %t622 = load i64, ptr %local.nu
  %t623 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.43)
  %t624 = call i64 @"sx_f64_mul"(i64 %t622, i64 %t623)
  %t625 = load i64, ptr %local.u4
  %t626 = call i64 @"sx_f64_mul"(i64 %t624, i64 %t625)
  %t627 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t626)
  store i64 %t627, ptr %local.du4.549
  %t628 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.44)
  %t629 = load i64, ptr %local.nu
  %t630 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.45)
  %t631 = call i64 @"sx_f64_mul"(i64 %t629, i64 %t630)
  %t632 = load i64, ptr %local.w0
  %t633 = call i64 @"sx_f64_mul"(i64 %t631, i64 %t632)
  %t634 = call i64 @"sx_f64_sub"(i64 %t628, i64 %t633)
  store i64 %t634, ptr %local.dw0.550
  %t635 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.46)
  %t636 = load i64, ptr %local.nu
  %t637 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.47)
  %t638 = call i64 @"sx_f64_mul"(i64 %t636, i64 %t637)
  %t639 = load i64, ptr %local.w1
  %t640 = call i64 @"sx_f64_mul"(i64 %t638, i64 %t639)
  %t641 = call i64 @"sx_f64_sub"(i64 %t635, i64 %t640)
  store i64 %t641, ptr %local.dw1.551
  %t642 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.48)
  %t643 = load i64, ptr %local.nu
  %t644 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.49)
  %t645 = call i64 @"sx_f64_mul"(i64 %t643, i64 %t644)
  %t646 = load i64, ptr %local.w2
  %t647 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t646)
  %t648 = call i64 @"sx_f64_sub"(i64 %t642, i64 %t647)
  store i64 %t648, ptr %local.dw2.552
  %t649 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.50)
  %t650 = load i64, ptr %local.nu
  %t651 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.51)
  %t652 = call i64 @"sx_f64_mul"(i64 %t650, i64 %t651)
  %t653 = load i64, ptr %local.w3
  %t654 = call i64 @"sx_f64_mul"(i64 %t652, i64 %t653)
  %t655 = call i64 @"sx_f64_sub"(i64 %t649, i64 %t654)
  store i64 %t655, ptr %local.dw3.553
  %t656 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.52)
  %t657 = load i64, ptr %local.nu
  %t658 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.53)
  %t659 = call i64 @"sx_f64_mul"(i64 %t657, i64 %t658)
  %t660 = load i64, ptr %local.w4
  %t661 = call i64 @"sx_f64_mul"(i64 %t659, i64 %t660)
  %t662 = call i64 @"sx_f64_sub"(i64 %t656, i64 %t661)
  store i64 %t662, ptr %local.dw4.554
  %t663 = load i64, ptr %local.sigma
  %t664 = load i64, ptr %local.w0
  %t665 = load i64, ptr %local.u1
  %t666 = call i64 @"sx_f64_mul"(i64 %t664, i64 %t665)
  %t667 = load i64, ptr %local.w1
  %t668 = load i64, ptr %local.u0
  %t669 = call i64 @"sx_f64_mul"(i64 %t667, i64 %t668)
  %t670 = call i64 @"sx_f64_sub"(i64 %t666, i64 %t669)
  %t671 = call i64 @"sx_f64_mul"(i64 %t663, i64 %t670)
  store i64 %t671, ptr %local.su0.555
  %t672 = load i64, ptr %local.sigma
  %t673 = load i64, ptr %local.w1
  %t674 = load i64, ptr %local.u0
  %t675 = call i64 @"sx_f64_mul"(i64 %t673, i64 %t674)
  %t676 = load i64, ptr %local.w0
  %t677 = load i64, ptr %local.u1
  %t678 = call i64 @"sx_f64_mul"(i64 %t676, i64 %t677)
  %t679 = call i64 @"sx_f64_sub"(i64 %t675, i64 %t678)
  %t680 = call i64 @"sx_f64_mul"(i64 %t672, i64 %t679)
  store i64 %t680, ptr %local.su1.556
  %t681 = load i64, ptr %local.sigma
  %t682 = load i64, ptr %local.w2
  %t683 = load i64, ptr %local.u3
  %t684 = call i64 @"sx_f64_mul"(i64 %t682, i64 %t683)
  %t685 = load i64, ptr %local.w3
  %t686 = load i64, ptr %local.u2
  %t687 = call i64 @"sx_f64_mul"(i64 %t685, i64 %t686)
  %t688 = call i64 @"sx_f64_sub"(i64 %t684, i64 %t687)
  %t689 = call i64 @"sx_f64_mul"(i64 %t681, i64 %t688)
  store i64 %t689, ptr %local.su2.557
  %t690 = load i64, ptr %local.sigma
  %t691 = load i64, ptr %local.w3
  %t692 = load i64, ptr %local.u2
  %t693 = call i64 @"sx_f64_mul"(i64 %t691, i64 %t692)
  %t694 = load i64, ptr %local.w2
  %t695 = load i64, ptr %local.u3
  %t696 = call i64 @"sx_f64_mul"(i64 %t694, i64 %t695)
  %t697 = call i64 @"sx_f64_sub"(i64 %t693, i64 %t696)
  %t698 = call i64 @"sx_f64_mul"(i64 %t690, i64 %t697)
  store i64 %t698, ptr %local.su3.558
  %t699 = load i64, ptr %local.sigma
  %t700 = load i64, ptr %local.w4
  %t701 = load i64, ptr %local.u0
  %t702 = call i64 @"sx_f64_mul"(i64 %t700, i64 %t701)
  %t703 = load i64, ptr %local.w0
  %t704 = load i64, ptr %local.u4
  %t705 = call i64 @"sx_f64_mul"(i64 %t703, i64 %t704)
  %t706 = call i64 @"sx_f64_sub"(i64 %t702, i64 %t705)
  %t707 = call i64 @"sx_f64_mul"(i64 %t699, i64 %t706)
  store i64 %t707, ptr %local.su4.559
  %t708 = load i64, ptr %local.lambda
  %t709 = load i64, ptr %local.w1
  %t710 = load i64, ptr %local.u0
  %t711 = call i64 @"sx_f64_mul"(i64 %t709, i64 %t710)
  %t712 = load i64, ptr %local.w0
  %t713 = load i64, ptr %local.u1
  %t714 = call i64 @"sx_f64_mul"(i64 %t712, i64 %t713)
  %t715 = call i64 @"sx_f64_add"(i64 %t711, i64 %t714)
  %t716 = call i64 @"sx_f64_mul"(i64 %t708, i64 %t715)
  store i64 %t716, ptr %local.vw0.560
  %t717 = load i64, ptr %local.lambda
  %t718 = load i64, ptr %local.w0
  %t719 = load i64, ptr %local.u1
  %t720 = call i64 @"sx_f64_mul"(i64 %t718, i64 %t719)
  %t721 = load i64, ptr %local.w1
  %t722 = load i64, ptr %local.u0
  %t723 = call i64 @"sx_f64_mul"(i64 %t721, i64 %t722)
  %t724 = call i64 @"sx_f64_add"(i64 %t720, i64 %t723)
  %t725 = call i64 @"sx_f64_mul"(i64 %t717, i64 %t724)
  store i64 %t725, ptr %local.vw1.561
  %t726 = load i64, ptr %local.lambda
  %t727 = load i64, ptr %local.w3
  %t728 = load i64, ptr %local.u2
  %t729 = call i64 @"sx_f64_mul"(i64 %t727, i64 %t728)
  %t730 = load i64, ptr %local.w2
  %t731 = load i64, ptr %local.u3
  %t732 = call i64 @"sx_f64_mul"(i64 %t730, i64 %t731)
  %t733 = call i64 @"sx_f64_add"(i64 %t729, i64 %t732)
  %t734 = call i64 @"sx_f64_mul"(i64 %t726, i64 %t733)
  store i64 %t734, ptr %local.vw2.562
  %t735 = load i64, ptr %local.lambda
  %t736 = load i64, ptr %local.w2
  %t737 = load i64, ptr %local.u3
  %t738 = call i64 @"sx_f64_mul"(i64 %t736, i64 %t737)
  %t739 = load i64, ptr %local.w3
  %t740 = load i64, ptr %local.u2
  %t741 = call i64 @"sx_f64_mul"(i64 %t739, i64 %t740)
  %t742 = call i64 @"sx_f64_add"(i64 %t738, i64 %t741)
  %t743 = call i64 @"sx_f64_mul"(i64 %t735, i64 %t742)
  store i64 %t743, ptr %local.vw3.563
  %t744 = load i64, ptr %local.lambda
  %t745 = load i64, ptr %local.w0
  %t746 = load i64, ptr %local.u4
  %t747 = call i64 @"sx_f64_mul"(i64 %t745, i64 %t746)
  %t748 = load i64, ptr %local.w4
  %t749 = load i64, ptr %local.u0
  %t750 = call i64 @"sx_f64_mul"(i64 %t748, i64 %t749)
  %t751 = call i64 @"sx_f64_add"(i64 %t747, i64 %t750)
  %t752 = call i64 @"sx_f64_mul"(i64 %t744, i64 %t751)
  store i64 %t752, ptr %local.vw4.564
  %t753 = load i64, ptr %local.lambda2
  %t754 = load i64, ptr %local.omega_sq.544
  %t755 = call i64 @"sx_f64_mul"(i64 %t753, i64 %t754)
  %t756 = load i64, ptr %local.w0
  %t757 = call i64 @"sx_f64_mul"(i64 %t755, i64 %t756)
  store i64 %t757, ptr %local.qw0.565
  %t758 = load i64, ptr %local.lambda2
  %t759 = load i64, ptr %local.omega_sq.544
  %t760 = call i64 @"sx_f64_mul"(i64 %t758, i64 %t759)
  %t761 = load i64, ptr %local.w1
  %t762 = call i64 @"sx_f64_mul"(i64 %t760, i64 %t761)
  store i64 %t762, ptr %local.qw1.566
  %t763 = load i64, ptr %local.lambda2
  %t764 = load i64, ptr %local.omega_sq.544
  %t765 = call i64 @"sx_f64_mul"(i64 %t763, i64 %t764)
  %t766 = load i64, ptr %local.w2
  %t767 = call i64 @"sx_f64_mul"(i64 %t765, i64 %t766)
  store i64 %t767, ptr %local.qw2.567
  %t768 = load i64, ptr %local.lambda2
  %t769 = load i64, ptr %local.omega_sq.544
  %t770 = call i64 @"sx_f64_mul"(i64 %t768, i64 %t769)
  %t771 = load i64, ptr %local.w3
  %t772 = call i64 @"sx_f64_mul"(i64 %t770, i64 %t771)
  store i64 %t772, ptr %local.qw3.568
  %t773 = load i64, ptr %local.lambda2
  %t774 = load i64, ptr %local.omega_sq.544
  %t775 = call i64 @"sx_f64_mul"(i64 %t773, i64 %t774)
  %t776 = load i64, ptr %local.w4
  %t777 = call i64 @"sx_f64_mul"(i64 %t775, i64 %t776)
  store i64 %t777, ptr %local.qw4.569
  %t778 = load i64, ptr %local.beta
  %t779 = load i64, ptr %local.w0
  %t780 = call i64 @"sx_f64_mul"(i64 %t778, i64 %t779)
  %t781 = load i64, ptr %local.w1
  %t782 = call i64 @"sx_f64_mul"(i64 %t780, i64 %t781)
  store i64 %t782, ptr %local.c_w2.570
  %t783 = load i64, ptr %local.beta
  %t784 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.54)
  %t785 = load i64, ptr %local.w0
  %t786 = load i64, ptr %local.w1
  %t787 = call i64 @"sx_f64_mul"(i64 %t785, i64 %t786)
  %t788 = call i64 @"sx_f64_sub"(i64 %t784, i64 %t787)
  %t789 = call i64 @"sx_f64_mul"(i64 %t783, i64 %t788)
  store i64 %t789, ptr %local.c_w3.571
  %t790 = load i64, ptr %local.beta
  %t791 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.55)
  %t792 = call i64 @"sx_f64_mul"(i64 %t790, i64 %t791)
  %t793 = load i64, ptr %local.w2
  %t794 = call i64 @"sx_f64_mul"(i64 %t792, i64 %t793)
  %t795 = load i64, ptr %local.w3
  %t796 = call i64 @"sx_f64_mul"(i64 %t794, i64 %t795)
  store i64 %t796, ptr %local.c_w4.572
  %t797 = load i64, ptr %local.beta
  %t798 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.56)
  %t799 = call i64 @"sx_f64_mul"(i64 %t797, i64 %t798)
  %t800 = load i64, ptr %local.w0
  %t801 = call i64 @"sx_f64_mul"(i64 %t799, i64 %t800)
  %t802 = load i64, ptr %local.w1
  %t803 = call i64 @"sx_f64_mul"(i64 %t801, i64 %t802)
  store i64 %t803, ptr %local.t_w4.573
  %t804 = load i64, ptr %local.which
  %t805 = icmp eq i64 %t804, 0
  %t806 = zext i1 %t805 to i64
  %t807 = icmp ne i64 %t806, 0
  br i1 %t807, label %then15, label %else15
then15:
  %t808 = load i64, ptr %local.u0
  %t809 = load i64, ptr %local.dt
  %t810 = load i64, ptr %local.du0.545
  %t811 = load i64, ptr %local.su0.555
  %t812 = call i64 @"sx_f64_add"(i64 %t810, i64 %t811)
  %t813 = call i64 @"sx_f64_mul"(i64 %t809, i64 %t812)
  %t814 = call i64 @"sx_f64_add"(i64 %t808, i64 %t813)
  ret i64 %t814
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t815 = phi i64 [ 0, %else15_end ]
  %t816 = load i64, ptr %local.which
  %t817 = icmp eq i64 %t816, 1
  %t818 = zext i1 %t817 to i64
  %t819 = icmp ne i64 %t818, 0
  br i1 %t819, label %then16, label %else16
then16:
  %t820 = load i64, ptr %local.u1
  %t821 = load i64, ptr %local.dt
  %t822 = load i64, ptr %local.du1.546
  %t823 = load i64, ptr %local.su1.556
  %t824 = call i64 @"sx_f64_add"(i64 %t822, i64 %t823)
  %t825 = call i64 @"sx_f64_mul"(i64 %t821, i64 %t824)
  %t826 = call i64 @"sx_f64_add"(i64 %t820, i64 %t825)
  ret i64 %t826
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t827 = phi i64 [ 0, %else16_end ]
  %t828 = load i64, ptr %local.which
  %t829 = icmp eq i64 %t828, 2
  %t830 = zext i1 %t829 to i64
  %t831 = icmp ne i64 %t830, 0
  br i1 %t831, label %then17, label %else17
then17:
  %t832 = load i64, ptr %local.u2
  %t833 = load i64, ptr %local.dt
  %t834 = load i64, ptr %local.du2.547
  %t835 = load i64, ptr %local.su2.557
  %t836 = call i64 @"sx_f64_add"(i64 %t834, i64 %t835)
  %t837 = call i64 @"sx_f64_mul"(i64 %t833, i64 %t836)
  %t838 = call i64 @"sx_f64_add"(i64 %t832, i64 %t837)
  ret i64 %t838
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t839 = phi i64 [ 0, %else17_end ]
  %t840 = load i64, ptr %local.which
  %t841 = icmp eq i64 %t840, 3
  %t842 = zext i1 %t841 to i64
  %t843 = icmp ne i64 %t842, 0
  br i1 %t843, label %then18, label %else18
then18:
  %t844 = load i64, ptr %local.u3
  %t845 = load i64, ptr %local.dt
  %t846 = load i64, ptr %local.du3.548
  %t847 = load i64, ptr %local.su3.558
  %t848 = call i64 @"sx_f64_add"(i64 %t846, i64 %t847)
  %t849 = call i64 @"sx_f64_mul"(i64 %t845, i64 %t848)
  %t850 = call i64 @"sx_f64_add"(i64 %t844, i64 %t849)
  ret i64 %t850
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t851 = phi i64 [ 0, %else18_end ]
  %t852 = load i64, ptr %local.which
  %t853 = icmp eq i64 %t852, 4
  %t854 = zext i1 %t853 to i64
  %t855 = icmp ne i64 %t854, 0
  br i1 %t855, label %then19, label %else19
then19:
  %t856 = load i64, ptr %local.u4
  %t857 = load i64, ptr %local.dt
  %t858 = load i64, ptr %local.du4.549
  %t859 = load i64, ptr %local.su4.559
  %t860 = call i64 @"sx_f64_add"(i64 %t858, i64 %t859)
  %t861 = call i64 @"sx_f64_mul"(i64 %t857, i64 %t860)
  %t862 = call i64 @"sx_f64_add"(i64 %t856, i64 %t861)
  ret i64 %t862
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t863 = phi i64 [ 0, %else19_end ]
  %t864 = load i64, ptr %local.which
  %t865 = icmp eq i64 %t864, 5
  %t866 = zext i1 %t865 to i64
  %t867 = icmp ne i64 %t866, 0
  br i1 %t867, label %then20, label %else20
then20:
  %t868 = load i64, ptr %local.w0
  %t869 = load i64, ptr %local.dt
  %t870 = load i64, ptr %local.dw0.550
  %t871 = load i64, ptr %local.vw0.560
  %t872 = call i64 @"sx_f64_add"(i64 %t870, i64 %t871)
  %t873 = load i64, ptr %local.qw0.565
  %t874 = call i64 @"sx_f64_add"(i64 %t872, i64 %t873)
  %t875 = call i64 @"sx_f64_mul"(i64 %t869, i64 %t874)
  %t876 = call i64 @"sx_f64_add"(i64 %t868, i64 %t875)
  ret i64 %t876
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t877 = phi i64 [ 0, %else20_end ]
  %t878 = load i64, ptr %local.which
  %t879 = icmp eq i64 %t878, 6
  %t880 = zext i1 %t879 to i64
  %t881 = icmp ne i64 %t880, 0
  br i1 %t881, label %then21, label %else21
then21:
  %t882 = load i64, ptr %local.w1
  %t883 = load i64, ptr %local.dt
  %t884 = load i64, ptr %local.dw1.551
  %t885 = load i64, ptr %local.vw1.561
  %t886 = call i64 @"sx_f64_add"(i64 %t884, i64 %t885)
  %t887 = load i64, ptr %local.qw1.566
  %t888 = call i64 @"sx_f64_add"(i64 %t886, i64 %t887)
  %t889 = call i64 @"sx_f64_mul"(i64 %t883, i64 %t888)
  %t890 = call i64 @"sx_f64_add"(i64 %t882, i64 %t889)
  ret i64 %t890
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t891 = phi i64 [ 0, %else21_end ]
  %t892 = load i64, ptr %local.which
  %t893 = icmp eq i64 %t892, 7
  %t894 = zext i1 %t893 to i64
  %t895 = icmp ne i64 %t894, 0
  br i1 %t895, label %then22, label %else22
then22:
  %t896 = load i64, ptr %local.w2
  %t897 = load i64, ptr %local.dt
  %t898 = load i64, ptr %local.dw2.552
  %t899 = load i64, ptr %local.vw2.562
  %t900 = call i64 @"sx_f64_add"(i64 %t898, i64 %t899)
  %t901 = load i64, ptr %local.qw2.567
  %t902 = call i64 @"sx_f64_add"(i64 %t900, i64 %t901)
  %t903 = load i64, ptr %local.c_w2.570
  %t904 = call i64 @"sx_f64_add"(i64 %t902, i64 %t903)
  %t905 = call i64 @"sx_f64_mul"(i64 %t897, i64 %t904)
  %t906 = call i64 @"sx_f64_add"(i64 %t896, i64 %t905)
  ret i64 %t906
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t907 = phi i64 [ 0, %else22_end ]
  %t908 = load i64, ptr %local.which
  %t909 = icmp eq i64 %t908, 8
  %t910 = zext i1 %t909 to i64
  %t911 = icmp ne i64 %t910, 0
  br i1 %t911, label %then23, label %else23
then23:
  %t912 = load i64, ptr %local.w3
  %t913 = load i64, ptr %local.dt
  %t914 = load i64, ptr %local.dw3.553
  %t915 = load i64, ptr %local.vw3.563
  %t916 = call i64 @"sx_f64_add"(i64 %t914, i64 %t915)
  %t917 = load i64, ptr %local.qw3.568
  %t918 = call i64 @"sx_f64_add"(i64 %t916, i64 %t917)
  %t919 = load i64, ptr %local.c_w3.571
  %t920 = call i64 @"sx_f64_add"(i64 %t918, i64 %t919)
  %t921 = call i64 @"sx_f64_mul"(i64 %t913, i64 %t920)
  %t922 = call i64 @"sx_f64_add"(i64 %t912, i64 %t921)
  ret i64 %t922
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t923 = phi i64 [ 0, %else23_end ]
  %t924 = load i64, ptr %local.w4
  %t925 = load i64, ptr %local.dt
  %t926 = load i64, ptr %local.dw4.554
  %t927 = load i64, ptr %local.vw4.564
  %t928 = call i64 @"sx_f64_add"(i64 %t926, i64 %t927)
  %t929 = load i64, ptr %local.qw4.569
  %t930 = call i64 @"sx_f64_add"(i64 %t928, i64 %t929)
  %t931 = load i64, ptr %local.c_w4.572
  %t932 = call i64 @"sx_f64_add"(i64 %t930, i64 %t931)
  %t933 = load i64, ptr %local.t_w4.573
  %t934 = call i64 @"sx_f64_add"(i64 %t932, i64 %t933)
  %t935 = call i64 @"sx_f64_mul"(i64 %t925, i64 %t934)
  %t936 = call i64 @"sx_f64_add"(i64 %t924, i64 %t935)
  ret i64 %t936
}

define i64 @"step12"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.937 = alloca i64
  %local.du0.938 = alloca i64
  %local.du1.939 = alloca i64
  %local.du2.940 = alloca i64
  %local.du3.941 = alloca i64
  %local.du4.942 = alloca i64
  %local.du5.943 = alloca i64
  %local.dw0.944 = alloca i64
  %local.dw1.945 = alloca i64
  %local.dw2.946 = alloca i64
  %local.dw3.947 = alloca i64
  %local.dw4.948 = alloca i64
  %local.dw5.949 = alloca i64
  %local.su0.950 = alloca i64
  %local.su1.951 = alloca i64
  %local.su2.952 = alloca i64
  %local.su3.953 = alloca i64
  %local.su4.954 = alloca i64
  %local.su5.955 = alloca i64
  %local.vw0.956 = alloca i64
  %local.vw1.957 = alloca i64
  %local.vw2.958 = alloca i64
  %local.vw3.959 = alloca i64
  %local.vw4.960 = alloca i64
  %local.vw5.961 = alloca i64
  %local.qw0.962 = alloca i64
  %local.qw1.963 = alloca i64
  %local.qw2.964 = alloca i64
  %local.qw3.965 = alloca i64
  %local.qw4.966 = alloca i64
  %local.qw5.967 = alloca i64
  %local.c_w2.968 = alloca i64
  %local.c_w3.969 = alloca i64
  %local.c_w4.970 = alloca i64
  %local.c_w5.971 = alloca i64
  %local.t_w4.972 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t973 = load i64, ptr %local.w0
  %t974 = load i64, ptr %local.w0
  %t975 = call i64 @"sx_f64_mul"(i64 %t973, i64 %t974)
  %t976 = load i64, ptr %local.w1
  %t977 = load i64, ptr %local.w1
  %t978 = call i64 @"sx_f64_mul"(i64 %t976, i64 %t977)
  %t979 = call i64 @"sx_f64_add"(i64 %t975, i64 %t978)
  %t980 = load i64, ptr %local.w2
  %t981 = load i64, ptr %local.w2
  %t982 = call i64 @"sx_f64_mul"(i64 %t980, i64 %t981)
  %t983 = call i64 @"sx_f64_add"(i64 %t979, i64 %t982)
  %t984 = load i64, ptr %local.w3
  %t985 = load i64, ptr %local.w3
  %t986 = call i64 @"sx_f64_mul"(i64 %t984, i64 %t985)
  %t987 = call i64 @"sx_f64_add"(i64 %t983, i64 %t986)
  %t988 = load i64, ptr %local.w4
  %t989 = load i64, ptr %local.w4
  %t990 = call i64 @"sx_f64_mul"(i64 %t988, i64 %t989)
  %t991 = call i64 @"sx_f64_add"(i64 %t987, i64 %t990)
  %t992 = load i64, ptr %local.w5
  %t993 = load i64, ptr %local.w5
  %t994 = call i64 @"sx_f64_mul"(i64 %t992, i64 %t993)
  %t995 = call i64 @"sx_f64_add"(i64 %t991, i64 %t994)
  store i64 %t995, ptr %local.omega_sq.937
  %t996 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.57)
  %t997 = load i64, ptr %local.nu
  %t998 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.58)
  %t999 = call i64 @"sx_f64_mul"(i64 %t997, i64 %t998)
  %t1000 = load i64, ptr %local.u0
  %t1001 = call i64 @"sx_f64_mul"(i64 %t999, i64 %t1000)
  %t1002 = call i64 @"sx_f64_sub"(i64 %t996, i64 %t1001)
  store i64 %t1002, ptr %local.du0.938
  %t1003 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.59)
  %t1004 = load i64, ptr %local.nu
  %t1005 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.60)
  %t1006 = call i64 @"sx_f64_mul"(i64 %t1004, i64 %t1005)
  %t1007 = load i64, ptr %local.u1
  %t1008 = call i64 @"sx_f64_mul"(i64 %t1006, i64 %t1007)
  %t1009 = call i64 @"sx_f64_sub"(i64 %t1003, i64 %t1008)
  store i64 %t1009, ptr %local.du1.939
  %t1010 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.61)
  %t1011 = load i64, ptr %local.nu
  %t1012 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.62)
  %t1013 = call i64 @"sx_f64_mul"(i64 %t1011, i64 %t1012)
  %t1014 = load i64, ptr %local.u2
  %t1015 = call i64 @"sx_f64_mul"(i64 %t1013, i64 %t1014)
  %t1016 = call i64 @"sx_f64_sub"(i64 %t1010, i64 %t1015)
  store i64 %t1016, ptr %local.du2.940
  %t1017 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.63)
  %t1018 = load i64, ptr %local.nu
  %t1019 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.64)
  %t1020 = call i64 @"sx_f64_mul"(i64 %t1018, i64 %t1019)
  %t1021 = load i64, ptr %local.u3
  %t1022 = call i64 @"sx_f64_mul"(i64 %t1020, i64 %t1021)
  %t1023 = call i64 @"sx_f64_sub"(i64 %t1017, i64 %t1022)
  store i64 %t1023, ptr %local.du3.941
  %t1024 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.65)
  %t1025 = load i64, ptr %local.nu
  %t1026 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.66)
  %t1027 = call i64 @"sx_f64_mul"(i64 %t1025, i64 %t1026)
  %t1028 = load i64, ptr %local.u4
  %t1029 = call i64 @"sx_f64_mul"(i64 %t1027, i64 %t1028)
  %t1030 = call i64 @"sx_f64_sub"(i64 %t1024, i64 %t1029)
  store i64 %t1030, ptr %local.du4.942
  %t1031 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.67)
  %t1032 = load i64, ptr %local.nu
  %t1033 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.68)
  %t1034 = call i64 @"sx_f64_mul"(i64 %t1032, i64 %t1033)
  %t1035 = load i64, ptr %local.u5
  %t1036 = call i64 @"sx_f64_mul"(i64 %t1034, i64 %t1035)
  %t1037 = call i64 @"sx_f64_sub"(i64 %t1031, i64 %t1036)
  store i64 %t1037, ptr %local.du5.943
  %t1038 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.69)
  %t1039 = load i64, ptr %local.nu
  %t1040 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.70)
  %t1041 = call i64 @"sx_f64_mul"(i64 %t1039, i64 %t1040)
  %t1042 = load i64, ptr %local.w0
  %t1043 = call i64 @"sx_f64_mul"(i64 %t1041, i64 %t1042)
  %t1044 = call i64 @"sx_f64_sub"(i64 %t1038, i64 %t1043)
  store i64 %t1044, ptr %local.dw0.944
  %t1045 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.71)
  %t1046 = load i64, ptr %local.nu
  %t1047 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.72)
  %t1048 = call i64 @"sx_f64_mul"(i64 %t1046, i64 %t1047)
  %t1049 = load i64, ptr %local.w1
  %t1050 = call i64 @"sx_f64_mul"(i64 %t1048, i64 %t1049)
  %t1051 = call i64 @"sx_f64_sub"(i64 %t1045, i64 %t1050)
  store i64 %t1051, ptr %local.dw1.945
  %t1052 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.73)
  %t1053 = load i64, ptr %local.nu
  %t1054 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.74)
  %t1055 = call i64 @"sx_f64_mul"(i64 %t1053, i64 %t1054)
  %t1056 = load i64, ptr %local.w2
  %t1057 = call i64 @"sx_f64_mul"(i64 %t1055, i64 %t1056)
  %t1058 = call i64 @"sx_f64_sub"(i64 %t1052, i64 %t1057)
  store i64 %t1058, ptr %local.dw2.946
  %t1059 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.75)
  %t1060 = load i64, ptr %local.nu
  %t1061 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.76)
  %t1062 = call i64 @"sx_f64_mul"(i64 %t1060, i64 %t1061)
  %t1063 = load i64, ptr %local.w3
  %t1064 = call i64 @"sx_f64_mul"(i64 %t1062, i64 %t1063)
  %t1065 = call i64 @"sx_f64_sub"(i64 %t1059, i64 %t1064)
  store i64 %t1065, ptr %local.dw3.947
  %t1066 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.77)
  %t1067 = load i64, ptr %local.nu
  %t1068 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.78)
  %t1069 = call i64 @"sx_f64_mul"(i64 %t1067, i64 %t1068)
  %t1070 = load i64, ptr %local.w4
  %t1071 = call i64 @"sx_f64_mul"(i64 %t1069, i64 %t1070)
  %t1072 = call i64 @"sx_f64_sub"(i64 %t1066, i64 %t1071)
  store i64 %t1072, ptr %local.dw4.948
  %t1073 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.79)
  %t1074 = load i64, ptr %local.nu
  %t1075 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.80)
  %t1076 = call i64 @"sx_f64_mul"(i64 %t1074, i64 %t1075)
  %t1077 = load i64, ptr %local.w5
  %t1078 = call i64 @"sx_f64_mul"(i64 %t1076, i64 %t1077)
  %t1079 = call i64 @"sx_f64_sub"(i64 %t1073, i64 %t1078)
  store i64 %t1079, ptr %local.dw5.949
  %t1080 = load i64, ptr %local.sigma
  %t1081 = load i64, ptr %local.w0
  %t1082 = load i64, ptr %local.u1
  %t1083 = call i64 @"sx_f64_mul"(i64 %t1081, i64 %t1082)
  %t1084 = load i64, ptr %local.w1
  %t1085 = load i64, ptr %local.u0
  %t1086 = call i64 @"sx_f64_mul"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @"sx_f64_sub"(i64 %t1083, i64 %t1086)
  %t1088 = call i64 @"sx_f64_mul"(i64 %t1080, i64 %t1087)
  store i64 %t1088, ptr %local.su0.950
  %t1089 = load i64, ptr %local.sigma
  %t1090 = load i64, ptr %local.w1
  %t1091 = load i64, ptr %local.u0
  %t1092 = call i64 @"sx_f64_mul"(i64 %t1090, i64 %t1091)
  %t1093 = load i64, ptr %local.w0
  %t1094 = load i64, ptr %local.u1
  %t1095 = call i64 @"sx_f64_mul"(i64 %t1093, i64 %t1094)
  %t1096 = call i64 @"sx_f64_sub"(i64 %t1092, i64 %t1095)
  %t1097 = call i64 @"sx_f64_mul"(i64 %t1089, i64 %t1096)
  store i64 %t1097, ptr %local.su1.951
  %t1098 = load i64, ptr %local.sigma
  %t1099 = load i64, ptr %local.w2
  %t1100 = load i64, ptr %local.u3
  %t1101 = call i64 @"sx_f64_mul"(i64 %t1099, i64 %t1100)
  %t1102 = load i64, ptr %local.w3
  %t1103 = load i64, ptr %local.u2
  %t1104 = call i64 @"sx_f64_mul"(i64 %t1102, i64 %t1103)
  %t1105 = call i64 @"sx_f64_sub"(i64 %t1101, i64 %t1104)
  %t1106 = call i64 @"sx_f64_mul"(i64 %t1098, i64 %t1105)
  store i64 %t1106, ptr %local.su2.952
  %t1107 = load i64, ptr %local.sigma
  %t1108 = load i64, ptr %local.w3
  %t1109 = load i64, ptr %local.u2
  %t1110 = call i64 @"sx_f64_mul"(i64 %t1108, i64 %t1109)
  %t1111 = load i64, ptr %local.w2
  %t1112 = load i64, ptr %local.u3
  %t1113 = call i64 @"sx_f64_mul"(i64 %t1111, i64 %t1112)
  %t1114 = call i64 @"sx_f64_sub"(i64 %t1110, i64 %t1113)
  %t1115 = call i64 @"sx_f64_mul"(i64 %t1107, i64 %t1114)
  store i64 %t1115, ptr %local.su3.953
  %t1116 = load i64, ptr %local.sigma
  %t1117 = load i64, ptr %local.w4
  %t1118 = load i64, ptr %local.u5
  %t1119 = call i64 @"sx_f64_mul"(i64 %t1117, i64 %t1118)
  %t1120 = load i64, ptr %local.w5
  %t1121 = load i64, ptr %local.u4
  %t1122 = call i64 @"sx_f64_mul"(i64 %t1120, i64 %t1121)
  %t1123 = call i64 @"sx_f64_sub"(i64 %t1119, i64 %t1122)
  %t1124 = call i64 @"sx_f64_mul"(i64 %t1116, i64 %t1123)
  store i64 %t1124, ptr %local.su4.954
  %t1125 = load i64, ptr %local.sigma
  %t1126 = load i64, ptr %local.w5
  %t1127 = load i64, ptr %local.u4
  %t1128 = call i64 @"sx_f64_mul"(i64 %t1126, i64 %t1127)
  %t1129 = load i64, ptr %local.w4
  %t1130 = load i64, ptr %local.u5
  %t1131 = call i64 @"sx_f64_mul"(i64 %t1129, i64 %t1130)
  %t1132 = call i64 @"sx_f64_sub"(i64 %t1128, i64 %t1131)
  %t1133 = call i64 @"sx_f64_mul"(i64 %t1125, i64 %t1132)
  store i64 %t1133, ptr %local.su5.955
  %t1134 = load i64, ptr %local.lambda
  %t1135 = load i64, ptr %local.w1
  %t1136 = load i64, ptr %local.u0
  %t1137 = call i64 @"sx_f64_mul"(i64 %t1135, i64 %t1136)
  %t1138 = load i64, ptr %local.w0
  %t1139 = load i64, ptr %local.u1
  %t1140 = call i64 @"sx_f64_mul"(i64 %t1138, i64 %t1139)
  %t1141 = call i64 @"sx_f64_add"(i64 %t1137, i64 %t1140)
  %t1142 = call i64 @"sx_f64_mul"(i64 %t1134, i64 %t1141)
  store i64 %t1142, ptr %local.vw0.956
  %t1143 = load i64, ptr %local.lambda
  %t1144 = load i64, ptr %local.w0
  %t1145 = load i64, ptr %local.u1
  %t1146 = call i64 @"sx_f64_mul"(i64 %t1144, i64 %t1145)
  %t1147 = load i64, ptr %local.w1
  %t1148 = load i64, ptr %local.u0
  %t1149 = call i64 @"sx_f64_mul"(i64 %t1147, i64 %t1148)
  %t1150 = call i64 @"sx_f64_add"(i64 %t1146, i64 %t1149)
  %t1151 = call i64 @"sx_f64_mul"(i64 %t1143, i64 %t1150)
  store i64 %t1151, ptr %local.vw1.957
  %t1152 = load i64, ptr %local.lambda
  %t1153 = load i64, ptr %local.w3
  %t1154 = load i64, ptr %local.u2
  %t1155 = call i64 @"sx_f64_mul"(i64 %t1153, i64 %t1154)
  %t1156 = load i64, ptr %local.w2
  %t1157 = load i64, ptr %local.u3
  %t1158 = call i64 @"sx_f64_mul"(i64 %t1156, i64 %t1157)
  %t1159 = call i64 @"sx_f64_add"(i64 %t1155, i64 %t1158)
  %t1160 = call i64 @"sx_f64_mul"(i64 %t1152, i64 %t1159)
  store i64 %t1160, ptr %local.vw2.958
  %t1161 = load i64, ptr %local.lambda
  %t1162 = load i64, ptr %local.w2
  %t1163 = load i64, ptr %local.u3
  %t1164 = call i64 @"sx_f64_mul"(i64 %t1162, i64 %t1163)
  %t1165 = load i64, ptr %local.w3
  %t1166 = load i64, ptr %local.u2
  %t1167 = call i64 @"sx_f64_mul"(i64 %t1165, i64 %t1166)
  %t1168 = call i64 @"sx_f64_add"(i64 %t1164, i64 %t1167)
  %t1169 = call i64 @"sx_f64_mul"(i64 %t1161, i64 %t1168)
  store i64 %t1169, ptr %local.vw3.959
  %t1170 = load i64, ptr %local.lambda
  %t1171 = load i64, ptr %local.w5
  %t1172 = load i64, ptr %local.u4
  %t1173 = call i64 @"sx_f64_mul"(i64 %t1171, i64 %t1172)
  %t1174 = load i64, ptr %local.w4
  %t1175 = load i64, ptr %local.u5
  %t1176 = call i64 @"sx_f64_mul"(i64 %t1174, i64 %t1175)
  %t1177 = call i64 @"sx_f64_add"(i64 %t1173, i64 %t1176)
  %t1178 = call i64 @"sx_f64_mul"(i64 %t1170, i64 %t1177)
  store i64 %t1178, ptr %local.vw4.960
  %t1179 = load i64, ptr %local.lambda
  %t1180 = load i64, ptr %local.w4
  %t1181 = load i64, ptr %local.u5
  %t1182 = call i64 @"sx_f64_mul"(i64 %t1180, i64 %t1181)
  %t1183 = load i64, ptr %local.w5
  %t1184 = load i64, ptr %local.u4
  %t1185 = call i64 @"sx_f64_mul"(i64 %t1183, i64 %t1184)
  %t1186 = call i64 @"sx_f64_add"(i64 %t1182, i64 %t1185)
  %t1187 = call i64 @"sx_f64_mul"(i64 %t1179, i64 %t1186)
  store i64 %t1187, ptr %local.vw5.961
  %t1188 = load i64, ptr %local.lambda2
  %t1189 = load i64, ptr %local.omega_sq.937
  %t1190 = call i64 @"sx_f64_mul"(i64 %t1188, i64 %t1189)
  %t1191 = load i64, ptr %local.w0
  %t1192 = call i64 @"sx_f64_mul"(i64 %t1190, i64 %t1191)
  store i64 %t1192, ptr %local.qw0.962
  %t1193 = load i64, ptr %local.lambda2
  %t1194 = load i64, ptr %local.omega_sq.937
  %t1195 = call i64 @"sx_f64_mul"(i64 %t1193, i64 %t1194)
  %t1196 = load i64, ptr %local.w1
  %t1197 = call i64 @"sx_f64_mul"(i64 %t1195, i64 %t1196)
  store i64 %t1197, ptr %local.qw1.963
  %t1198 = load i64, ptr %local.lambda2
  %t1199 = load i64, ptr %local.omega_sq.937
  %t1200 = call i64 @"sx_f64_mul"(i64 %t1198, i64 %t1199)
  %t1201 = load i64, ptr %local.w2
  %t1202 = call i64 @"sx_f64_mul"(i64 %t1200, i64 %t1201)
  store i64 %t1202, ptr %local.qw2.964
  %t1203 = load i64, ptr %local.lambda2
  %t1204 = load i64, ptr %local.omega_sq.937
  %t1205 = call i64 @"sx_f64_mul"(i64 %t1203, i64 %t1204)
  %t1206 = load i64, ptr %local.w3
  %t1207 = call i64 @"sx_f64_mul"(i64 %t1205, i64 %t1206)
  store i64 %t1207, ptr %local.qw3.965
  %t1208 = load i64, ptr %local.lambda2
  %t1209 = load i64, ptr %local.omega_sq.937
  %t1210 = call i64 @"sx_f64_mul"(i64 %t1208, i64 %t1209)
  %t1211 = load i64, ptr %local.w4
  %t1212 = call i64 @"sx_f64_mul"(i64 %t1210, i64 %t1211)
  store i64 %t1212, ptr %local.qw4.966
  %t1213 = load i64, ptr %local.lambda2
  %t1214 = load i64, ptr %local.omega_sq.937
  %t1215 = call i64 @"sx_f64_mul"(i64 %t1213, i64 %t1214)
  %t1216 = load i64, ptr %local.w5
  %t1217 = call i64 @"sx_f64_mul"(i64 %t1215, i64 %t1216)
  store i64 %t1217, ptr %local.qw5.967
  %t1218 = load i64, ptr %local.beta
  %t1219 = load i64, ptr %local.w0
  %t1220 = call i64 @"sx_f64_mul"(i64 %t1218, i64 %t1219)
  %t1221 = load i64, ptr %local.w1
  %t1222 = call i64 @"sx_f64_mul"(i64 %t1220, i64 %t1221)
  store i64 %t1222, ptr %local.c_w2.968
  %t1223 = load i64, ptr %local.beta
  %t1224 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.81)
  %t1225 = load i64, ptr %local.w0
  %t1226 = load i64, ptr %local.w1
  %t1227 = call i64 @"sx_f64_mul"(i64 %t1225, i64 %t1226)
  %t1228 = call i64 @"sx_f64_sub"(i64 %t1224, i64 %t1227)
  %t1229 = call i64 @"sx_f64_mul"(i64 %t1223, i64 %t1228)
  store i64 %t1229, ptr %local.c_w3.969
  %t1230 = load i64, ptr %local.beta
  %t1231 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.82)
  %t1232 = call i64 @"sx_f64_mul"(i64 %t1230, i64 %t1231)
  %t1233 = load i64, ptr %local.w2
  %t1234 = call i64 @"sx_f64_mul"(i64 %t1232, i64 %t1233)
  %t1235 = load i64, ptr %local.w3
  %t1236 = call i64 @"sx_f64_mul"(i64 %t1234, i64 %t1235)
  store i64 %t1236, ptr %local.c_w4.970
  %t1237 = load i64, ptr %local.beta
  %t1238 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.83)
  %t1239 = call i64 @"sx_f64_mul"(i64 %t1237, i64 %t1238)
  %t1240 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.84)
  %t1241 = load i64, ptr %local.w2
  %t1242 = load i64, ptr %local.w3
  %t1243 = call i64 @"sx_f64_mul"(i64 %t1241, i64 %t1242)
  %t1244 = call i64 @"sx_f64_sub"(i64 %t1240, i64 %t1243)
  %t1245 = call i64 @"sx_f64_mul"(i64 %t1239, i64 %t1244)
  store i64 %t1245, ptr %local.c_w5.971
  %t1246 = load i64, ptr %local.beta
  %t1247 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.85)
  %t1248 = call i64 @"sx_f64_mul"(i64 %t1246, i64 %t1247)
  %t1249 = load i64, ptr %local.w0
  %t1250 = call i64 @"sx_f64_mul"(i64 %t1248, i64 %t1249)
  %t1251 = load i64, ptr %local.w1
  %t1252 = call i64 @"sx_f64_mul"(i64 %t1250, i64 %t1251)
  store i64 %t1252, ptr %local.t_w4.972
  %t1253 = load i64, ptr %local.which
  %t1254 = icmp eq i64 %t1253, 0
  %t1255 = zext i1 %t1254 to i64
  %t1256 = icmp ne i64 %t1255, 0
  br i1 %t1256, label %then24, label %else24
then24:
  %t1257 = load i64, ptr %local.u0
  %t1258 = load i64, ptr %local.dt
  %t1259 = load i64, ptr %local.du0.938
  %t1260 = load i64, ptr %local.su0.950
  %t1261 = call i64 @"sx_f64_add"(i64 %t1259, i64 %t1260)
  %t1262 = call i64 @"sx_f64_mul"(i64 %t1258, i64 %t1261)
  %t1263 = call i64 @"sx_f64_add"(i64 %t1257, i64 %t1262)
  ret i64 %t1263
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1264 = phi i64 [ 0, %else24_end ]
  %t1265 = load i64, ptr %local.which
  %t1266 = icmp eq i64 %t1265, 1
  %t1267 = zext i1 %t1266 to i64
  %t1268 = icmp ne i64 %t1267, 0
  br i1 %t1268, label %then25, label %else25
then25:
  %t1269 = load i64, ptr %local.u1
  %t1270 = load i64, ptr %local.dt
  %t1271 = load i64, ptr %local.du1.939
  %t1272 = load i64, ptr %local.su1.951
  %t1273 = call i64 @"sx_f64_add"(i64 %t1271, i64 %t1272)
  %t1274 = call i64 @"sx_f64_mul"(i64 %t1270, i64 %t1273)
  %t1275 = call i64 @"sx_f64_add"(i64 %t1269, i64 %t1274)
  ret i64 %t1275
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1276 = phi i64 [ 0, %else25_end ]
  %t1277 = load i64, ptr %local.which
  %t1278 = icmp eq i64 %t1277, 2
  %t1279 = zext i1 %t1278 to i64
  %t1280 = icmp ne i64 %t1279, 0
  br i1 %t1280, label %then26, label %else26
then26:
  %t1281 = load i64, ptr %local.u2
  %t1282 = load i64, ptr %local.dt
  %t1283 = load i64, ptr %local.du2.940
  %t1284 = load i64, ptr %local.su2.952
  %t1285 = call i64 @"sx_f64_add"(i64 %t1283, i64 %t1284)
  %t1286 = call i64 @"sx_f64_mul"(i64 %t1282, i64 %t1285)
  %t1287 = call i64 @"sx_f64_add"(i64 %t1281, i64 %t1286)
  ret i64 %t1287
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1288 = phi i64 [ 0, %else26_end ]
  %t1289 = load i64, ptr %local.which
  %t1290 = icmp eq i64 %t1289, 3
  %t1291 = zext i1 %t1290 to i64
  %t1292 = icmp ne i64 %t1291, 0
  br i1 %t1292, label %then27, label %else27
then27:
  %t1293 = load i64, ptr %local.u3
  %t1294 = load i64, ptr %local.dt
  %t1295 = load i64, ptr %local.du3.941
  %t1296 = load i64, ptr %local.su3.953
  %t1297 = call i64 @"sx_f64_add"(i64 %t1295, i64 %t1296)
  %t1298 = call i64 @"sx_f64_mul"(i64 %t1294, i64 %t1297)
  %t1299 = call i64 @"sx_f64_add"(i64 %t1293, i64 %t1298)
  ret i64 %t1299
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1300 = phi i64 [ 0, %else27_end ]
  %t1301 = load i64, ptr %local.which
  %t1302 = icmp eq i64 %t1301, 4
  %t1303 = zext i1 %t1302 to i64
  %t1304 = icmp ne i64 %t1303, 0
  br i1 %t1304, label %then28, label %else28
then28:
  %t1305 = load i64, ptr %local.u4
  %t1306 = load i64, ptr %local.dt
  %t1307 = load i64, ptr %local.du4.942
  %t1308 = load i64, ptr %local.su4.954
  %t1309 = call i64 @"sx_f64_add"(i64 %t1307, i64 %t1308)
  %t1310 = call i64 @"sx_f64_mul"(i64 %t1306, i64 %t1309)
  %t1311 = call i64 @"sx_f64_add"(i64 %t1305, i64 %t1310)
  ret i64 %t1311
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1312 = phi i64 [ 0, %else28_end ]
  %t1313 = load i64, ptr %local.which
  %t1314 = icmp eq i64 %t1313, 5
  %t1315 = zext i1 %t1314 to i64
  %t1316 = icmp ne i64 %t1315, 0
  br i1 %t1316, label %then29, label %else29
then29:
  %t1317 = load i64, ptr %local.u5
  %t1318 = load i64, ptr %local.dt
  %t1319 = load i64, ptr %local.du5.943
  %t1320 = load i64, ptr %local.su5.955
  %t1321 = call i64 @"sx_f64_add"(i64 %t1319, i64 %t1320)
  %t1322 = call i64 @"sx_f64_mul"(i64 %t1318, i64 %t1321)
  %t1323 = call i64 @"sx_f64_add"(i64 %t1317, i64 %t1322)
  ret i64 %t1323
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1324 = phi i64 [ 0, %else29_end ]
  %t1325 = load i64, ptr %local.which
  %t1326 = icmp eq i64 %t1325, 6
  %t1327 = zext i1 %t1326 to i64
  %t1328 = icmp ne i64 %t1327, 0
  br i1 %t1328, label %then30, label %else30
then30:
  %t1329 = load i64, ptr %local.w0
  %t1330 = load i64, ptr %local.dt
  %t1331 = load i64, ptr %local.dw0.944
  %t1332 = load i64, ptr %local.vw0.956
  %t1333 = call i64 @"sx_f64_add"(i64 %t1331, i64 %t1332)
  %t1334 = load i64, ptr %local.qw0.962
  %t1335 = call i64 @"sx_f64_add"(i64 %t1333, i64 %t1334)
  %t1336 = call i64 @"sx_f64_mul"(i64 %t1330, i64 %t1335)
  %t1337 = call i64 @"sx_f64_add"(i64 %t1329, i64 %t1336)
  ret i64 %t1337
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1338 = phi i64 [ 0, %else30_end ]
  %t1339 = load i64, ptr %local.which
  %t1340 = icmp eq i64 %t1339, 7
  %t1341 = zext i1 %t1340 to i64
  %t1342 = icmp ne i64 %t1341, 0
  br i1 %t1342, label %then31, label %else31
then31:
  %t1343 = load i64, ptr %local.w1
  %t1344 = load i64, ptr %local.dt
  %t1345 = load i64, ptr %local.dw1.945
  %t1346 = load i64, ptr %local.vw1.957
  %t1347 = call i64 @"sx_f64_add"(i64 %t1345, i64 %t1346)
  %t1348 = load i64, ptr %local.qw1.963
  %t1349 = call i64 @"sx_f64_add"(i64 %t1347, i64 %t1348)
  %t1350 = call i64 @"sx_f64_mul"(i64 %t1344, i64 %t1349)
  %t1351 = call i64 @"sx_f64_add"(i64 %t1343, i64 %t1350)
  ret i64 %t1351
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1352 = phi i64 [ 0, %else31_end ]
  %t1353 = load i64, ptr %local.which
  %t1354 = icmp eq i64 %t1353, 8
  %t1355 = zext i1 %t1354 to i64
  %t1356 = icmp ne i64 %t1355, 0
  br i1 %t1356, label %then32, label %else32
then32:
  %t1357 = load i64, ptr %local.w2
  %t1358 = load i64, ptr %local.dt
  %t1359 = load i64, ptr %local.dw2.946
  %t1360 = load i64, ptr %local.vw2.958
  %t1361 = call i64 @"sx_f64_add"(i64 %t1359, i64 %t1360)
  %t1362 = load i64, ptr %local.qw2.964
  %t1363 = call i64 @"sx_f64_add"(i64 %t1361, i64 %t1362)
  %t1364 = load i64, ptr %local.c_w2.968
  %t1365 = call i64 @"sx_f64_add"(i64 %t1363, i64 %t1364)
  %t1366 = call i64 @"sx_f64_mul"(i64 %t1358, i64 %t1365)
  %t1367 = call i64 @"sx_f64_add"(i64 %t1357, i64 %t1366)
  ret i64 %t1367
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1368 = phi i64 [ 0, %else32_end ]
  %t1369 = load i64, ptr %local.which
  %t1370 = icmp eq i64 %t1369, 9
  %t1371 = zext i1 %t1370 to i64
  %t1372 = icmp ne i64 %t1371, 0
  br i1 %t1372, label %then33, label %else33
then33:
  %t1373 = load i64, ptr %local.w3
  %t1374 = load i64, ptr %local.dt
  %t1375 = load i64, ptr %local.dw3.947
  %t1376 = load i64, ptr %local.vw3.959
  %t1377 = call i64 @"sx_f64_add"(i64 %t1375, i64 %t1376)
  %t1378 = load i64, ptr %local.qw3.965
  %t1379 = call i64 @"sx_f64_add"(i64 %t1377, i64 %t1378)
  %t1380 = load i64, ptr %local.c_w3.969
  %t1381 = call i64 @"sx_f64_add"(i64 %t1379, i64 %t1380)
  %t1382 = call i64 @"sx_f64_mul"(i64 %t1374, i64 %t1381)
  %t1383 = call i64 @"sx_f64_add"(i64 %t1373, i64 %t1382)
  ret i64 %t1383
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1384 = phi i64 [ 0, %else33_end ]
  %t1385 = load i64, ptr %local.which
  %t1386 = icmp eq i64 %t1385, 10
  %t1387 = zext i1 %t1386 to i64
  %t1388 = icmp ne i64 %t1387, 0
  br i1 %t1388, label %then34, label %else34
then34:
  %t1389 = load i64, ptr %local.w4
  %t1390 = load i64, ptr %local.dt
  %t1391 = load i64, ptr %local.dw4.948
  %t1392 = load i64, ptr %local.vw4.960
  %t1393 = call i64 @"sx_f64_add"(i64 %t1391, i64 %t1392)
  %t1394 = load i64, ptr %local.qw4.966
  %t1395 = call i64 @"sx_f64_add"(i64 %t1393, i64 %t1394)
  %t1396 = load i64, ptr %local.c_w4.970
  %t1397 = call i64 @"sx_f64_add"(i64 %t1395, i64 %t1396)
  %t1398 = load i64, ptr %local.t_w4.972
  %t1399 = call i64 @"sx_f64_add"(i64 %t1397, i64 %t1398)
  %t1400 = call i64 @"sx_f64_mul"(i64 %t1390, i64 %t1399)
  %t1401 = call i64 @"sx_f64_add"(i64 %t1389, i64 %t1400)
  ret i64 %t1401
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1402 = phi i64 [ 0, %else34_end ]
  %t1403 = load i64, ptr %local.w5
  %t1404 = load i64, ptr %local.dt
  %t1405 = load i64, ptr %local.dw5.949
  %t1406 = load i64, ptr %local.vw5.961
  %t1407 = call i64 @"sx_f64_add"(i64 %t1405, i64 %t1406)
  %t1408 = load i64, ptr %local.qw5.967
  %t1409 = call i64 @"sx_f64_add"(i64 %t1407, i64 %t1408)
  %t1410 = load i64, ptr %local.c_w5.971
  %t1411 = call i64 @"sx_f64_add"(i64 %t1409, i64 %t1410)
  %t1412 = call i64 @"sx_f64_mul"(i64 %t1404, i64 %t1411)
  %t1413 = call i64 @"sx_f64_add"(i64 %t1403, i64 %t1412)
  ret i64 %t1413
}

define i64 @"step16"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %w6, i64 %w7, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.1414 = alloca i64
  %local.du0.1415 = alloca i64
  %local.du1.1416 = alloca i64
  %local.du2.1417 = alloca i64
  %local.du3.1418 = alloca i64
  %local.du4.1419 = alloca i64
  %local.du5.1420 = alloca i64
  %local.du6.1421 = alloca i64
  %local.du7.1422 = alloca i64
  %local.dw0.1423 = alloca i64
  %local.dw1.1424 = alloca i64
  %local.dw2.1425 = alloca i64
  %local.dw3.1426 = alloca i64
  %local.dw4.1427 = alloca i64
  %local.dw5.1428 = alloca i64
  %local.dw6.1429 = alloca i64
  %local.dw7.1430 = alloca i64
  %local.su0.1431 = alloca i64
  %local.su1.1432 = alloca i64
  %local.su2.1433 = alloca i64
  %local.su3.1434 = alloca i64
  %local.su4.1435 = alloca i64
  %local.su5.1436 = alloca i64
  %local.su6.1437 = alloca i64
  %local.su7.1438 = alloca i64
  %local.vw0.1439 = alloca i64
  %local.vw1.1440 = alloca i64
  %local.vw2.1441 = alloca i64
  %local.vw3.1442 = alloca i64
  %local.vw4.1443 = alloca i64
  %local.vw5.1444 = alloca i64
  %local.vw6.1445 = alloca i64
  %local.vw7.1446 = alloca i64
  %local.qw0.1447 = alloca i64
  %local.qw1.1448 = alloca i64
  %local.qw2.1449 = alloca i64
  %local.qw3.1450 = alloca i64
  %local.qw4.1451 = alloca i64
  %local.qw5.1452 = alloca i64
  %local.qw6.1453 = alloca i64
  %local.qw7.1454 = alloca i64
  %local.c_w2.1455 = alloca i64
  %local.c_w3.1456 = alloca i64
  %local.c_w4.1457 = alloca i64
  %local.c_w5.1458 = alloca i64
  %local.c_w6.1459 = alloca i64
  %local.c_w7.1460 = alloca i64
  %local.t_w4.1461 = alloca i64
  %local.t_w6.1462 = alloca i64
  %local.t2_w6.1463 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.w6 = alloca i64
  store i64 %w6, ptr %local.w6
  %local.w7 = alloca i64
  store i64 %w7, ptr %local.w7
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t1464 = load i64, ptr %local.w0
  %t1465 = load i64, ptr %local.w0
  %t1466 = call i64 @"sx_f64_mul"(i64 %t1464, i64 %t1465)
  %t1467 = load i64, ptr %local.w1
  %t1468 = load i64, ptr %local.w1
  %t1469 = call i64 @"sx_f64_mul"(i64 %t1467, i64 %t1468)
  %t1470 = call i64 @"sx_f64_add"(i64 %t1466, i64 %t1469)
  %t1471 = load i64, ptr %local.w2
  %t1472 = load i64, ptr %local.w2
  %t1473 = call i64 @"sx_f64_mul"(i64 %t1471, i64 %t1472)
  %t1474 = call i64 @"sx_f64_add"(i64 %t1470, i64 %t1473)
  %t1475 = load i64, ptr %local.w3
  %t1476 = load i64, ptr %local.w3
  %t1477 = call i64 @"sx_f64_mul"(i64 %t1475, i64 %t1476)
  %t1478 = call i64 @"sx_f64_add"(i64 %t1474, i64 %t1477)
  %t1479 = load i64, ptr %local.w4
  %t1480 = load i64, ptr %local.w4
  %t1481 = call i64 @"sx_f64_mul"(i64 %t1479, i64 %t1480)
  %t1482 = call i64 @"sx_f64_add"(i64 %t1478, i64 %t1481)
  %t1483 = load i64, ptr %local.w5
  %t1484 = load i64, ptr %local.w5
  %t1485 = call i64 @"sx_f64_mul"(i64 %t1483, i64 %t1484)
  %t1486 = call i64 @"sx_f64_add"(i64 %t1482, i64 %t1485)
  %t1487 = load i64, ptr %local.w6
  %t1488 = load i64, ptr %local.w6
  %t1489 = call i64 @"sx_f64_mul"(i64 %t1487, i64 %t1488)
  %t1490 = call i64 @"sx_f64_add"(i64 %t1486, i64 %t1489)
  %t1491 = load i64, ptr %local.w7
  %t1492 = load i64, ptr %local.w7
  %t1493 = call i64 @"sx_f64_mul"(i64 %t1491, i64 %t1492)
  %t1494 = call i64 @"sx_f64_add"(i64 %t1490, i64 %t1493)
  store i64 %t1494, ptr %local.omega_sq.1414
  %t1495 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.86)
  %t1496 = load i64, ptr %local.nu
  %t1497 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.87)
  %t1498 = call i64 @"sx_f64_mul"(i64 %t1496, i64 %t1497)
  %t1499 = load i64, ptr %local.u0
  %t1500 = call i64 @"sx_f64_mul"(i64 %t1498, i64 %t1499)
  %t1501 = call i64 @"sx_f64_sub"(i64 %t1495, i64 %t1500)
  store i64 %t1501, ptr %local.du0.1415
  %t1502 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.88)
  %t1503 = load i64, ptr %local.nu
  %t1504 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.89)
  %t1505 = call i64 @"sx_f64_mul"(i64 %t1503, i64 %t1504)
  %t1506 = load i64, ptr %local.u1
  %t1507 = call i64 @"sx_f64_mul"(i64 %t1505, i64 %t1506)
  %t1508 = call i64 @"sx_f64_sub"(i64 %t1502, i64 %t1507)
  store i64 %t1508, ptr %local.du1.1416
  %t1509 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.90)
  %t1510 = load i64, ptr %local.nu
  %t1511 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.91)
  %t1512 = call i64 @"sx_f64_mul"(i64 %t1510, i64 %t1511)
  %t1513 = load i64, ptr %local.u2
  %t1514 = call i64 @"sx_f64_mul"(i64 %t1512, i64 %t1513)
  %t1515 = call i64 @"sx_f64_sub"(i64 %t1509, i64 %t1514)
  store i64 %t1515, ptr %local.du2.1417
  %t1516 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.92)
  %t1517 = load i64, ptr %local.nu
  %t1518 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.93)
  %t1519 = call i64 @"sx_f64_mul"(i64 %t1517, i64 %t1518)
  %t1520 = load i64, ptr %local.u3
  %t1521 = call i64 @"sx_f64_mul"(i64 %t1519, i64 %t1520)
  %t1522 = call i64 @"sx_f64_sub"(i64 %t1516, i64 %t1521)
  store i64 %t1522, ptr %local.du3.1418
  %t1523 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.94)
  %t1524 = load i64, ptr %local.nu
  %t1525 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.95)
  %t1526 = call i64 @"sx_f64_mul"(i64 %t1524, i64 %t1525)
  %t1527 = load i64, ptr %local.u4
  %t1528 = call i64 @"sx_f64_mul"(i64 %t1526, i64 %t1527)
  %t1529 = call i64 @"sx_f64_sub"(i64 %t1523, i64 %t1528)
  store i64 %t1529, ptr %local.du4.1419
  %t1530 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.96)
  %t1531 = load i64, ptr %local.nu
  %t1532 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.97)
  %t1533 = call i64 @"sx_f64_mul"(i64 %t1531, i64 %t1532)
  %t1534 = load i64, ptr %local.u5
  %t1535 = call i64 @"sx_f64_mul"(i64 %t1533, i64 %t1534)
  %t1536 = call i64 @"sx_f64_sub"(i64 %t1530, i64 %t1535)
  store i64 %t1536, ptr %local.du5.1420
  %t1537 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.98)
  %t1538 = load i64, ptr %local.nu
  %t1539 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.99)
  %t1540 = call i64 @"sx_f64_mul"(i64 %t1538, i64 %t1539)
  %t1541 = load i64, ptr %local.u6
  %t1542 = call i64 @"sx_f64_mul"(i64 %t1540, i64 %t1541)
  %t1543 = call i64 @"sx_f64_sub"(i64 %t1537, i64 %t1542)
  store i64 %t1543, ptr %local.du6.1421
  %t1544 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.100)
  %t1545 = load i64, ptr %local.nu
  %t1546 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.101)
  %t1547 = call i64 @"sx_f64_mul"(i64 %t1545, i64 %t1546)
  %t1548 = load i64, ptr %local.u7
  %t1549 = call i64 @"sx_f64_mul"(i64 %t1547, i64 %t1548)
  %t1550 = call i64 @"sx_f64_sub"(i64 %t1544, i64 %t1549)
  store i64 %t1550, ptr %local.du7.1422
  %t1551 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.102)
  %t1552 = load i64, ptr %local.nu
  %t1553 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.103)
  %t1554 = call i64 @"sx_f64_mul"(i64 %t1552, i64 %t1553)
  %t1555 = load i64, ptr %local.w0
  %t1556 = call i64 @"sx_f64_mul"(i64 %t1554, i64 %t1555)
  %t1557 = call i64 @"sx_f64_sub"(i64 %t1551, i64 %t1556)
  store i64 %t1557, ptr %local.dw0.1423
  %t1558 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.104)
  %t1559 = load i64, ptr %local.nu
  %t1560 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.105)
  %t1561 = call i64 @"sx_f64_mul"(i64 %t1559, i64 %t1560)
  %t1562 = load i64, ptr %local.w1
  %t1563 = call i64 @"sx_f64_mul"(i64 %t1561, i64 %t1562)
  %t1564 = call i64 @"sx_f64_sub"(i64 %t1558, i64 %t1563)
  store i64 %t1564, ptr %local.dw1.1424
  %t1565 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.106)
  %t1566 = load i64, ptr %local.nu
  %t1567 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.107)
  %t1568 = call i64 @"sx_f64_mul"(i64 %t1566, i64 %t1567)
  %t1569 = load i64, ptr %local.w2
  %t1570 = call i64 @"sx_f64_mul"(i64 %t1568, i64 %t1569)
  %t1571 = call i64 @"sx_f64_sub"(i64 %t1565, i64 %t1570)
  store i64 %t1571, ptr %local.dw2.1425
  %t1572 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.108)
  %t1573 = load i64, ptr %local.nu
  %t1574 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.109)
  %t1575 = call i64 @"sx_f64_mul"(i64 %t1573, i64 %t1574)
  %t1576 = load i64, ptr %local.w3
  %t1577 = call i64 @"sx_f64_mul"(i64 %t1575, i64 %t1576)
  %t1578 = call i64 @"sx_f64_sub"(i64 %t1572, i64 %t1577)
  store i64 %t1578, ptr %local.dw3.1426
  %t1579 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.110)
  %t1580 = load i64, ptr %local.nu
  %t1581 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.111)
  %t1582 = call i64 @"sx_f64_mul"(i64 %t1580, i64 %t1581)
  %t1583 = load i64, ptr %local.w4
  %t1584 = call i64 @"sx_f64_mul"(i64 %t1582, i64 %t1583)
  %t1585 = call i64 @"sx_f64_sub"(i64 %t1579, i64 %t1584)
  store i64 %t1585, ptr %local.dw4.1427
  %t1586 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.112)
  %t1587 = load i64, ptr %local.nu
  %t1588 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.113)
  %t1589 = call i64 @"sx_f64_mul"(i64 %t1587, i64 %t1588)
  %t1590 = load i64, ptr %local.w5
  %t1591 = call i64 @"sx_f64_mul"(i64 %t1589, i64 %t1590)
  %t1592 = call i64 @"sx_f64_sub"(i64 %t1586, i64 %t1591)
  store i64 %t1592, ptr %local.dw5.1428
  %t1593 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.114)
  %t1594 = load i64, ptr %local.nu
  %t1595 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.115)
  %t1596 = call i64 @"sx_f64_mul"(i64 %t1594, i64 %t1595)
  %t1597 = load i64, ptr %local.w6
  %t1598 = call i64 @"sx_f64_mul"(i64 %t1596, i64 %t1597)
  %t1599 = call i64 @"sx_f64_sub"(i64 %t1593, i64 %t1598)
  store i64 %t1599, ptr %local.dw6.1429
  %t1600 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.116)
  %t1601 = load i64, ptr %local.nu
  %t1602 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.117)
  %t1603 = call i64 @"sx_f64_mul"(i64 %t1601, i64 %t1602)
  %t1604 = load i64, ptr %local.w7
  %t1605 = call i64 @"sx_f64_mul"(i64 %t1603, i64 %t1604)
  %t1606 = call i64 @"sx_f64_sub"(i64 %t1600, i64 %t1605)
  store i64 %t1606, ptr %local.dw7.1430
  %t1607 = load i64, ptr %local.sigma
  %t1608 = load i64, ptr %local.w0
  %t1609 = load i64, ptr %local.u1
  %t1610 = call i64 @"sx_f64_mul"(i64 %t1608, i64 %t1609)
  %t1611 = load i64, ptr %local.w1
  %t1612 = load i64, ptr %local.u0
  %t1613 = call i64 @"sx_f64_mul"(i64 %t1611, i64 %t1612)
  %t1614 = call i64 @"sx_f64_sub"(i64 %t1610, i64 %t1613)
  %t1615 = call i64 @"sx_f64_mul"(i64 %t1607, i64 %t1614)
  store i64 %t1615, ptr %local.su0.1431
  %t1616 = load i64, ptr %local.sigma
  %t1617 = load i64, ptr %local.w1
  %t1618 = load i64, ptr %local.u0
  %t1619 = call i64 @"sx_f64_mul"(i64 %t1617, i64 %t1618)
  %t1620 = load i64, ptr %local.w0
  %t1621 = load i64, ptr %local.u1
  %t1622 = call i64 @"sx_f64_mul"(i64 %t1620, i64 %t1621)
  %t1623 = call i64 @"sx_f64_sub"(i64 %t1619, i64 %t1622)
  %t1624 = call i64 @"sx_f64_mul"(i64 %t1616, i64 %t1623)
  store i64 %t1624, ptr %local.su1.1432
  %t1625 = load i64, ptr %local.sigma
  %t1626 = load i64, ptr %local.w2
  %t1627 = load i64, ptr %local.u3
  %t1628 = call i64 @"sx_f64_mul"(i64 %t1626, i64 %t1627)
  %t1629 = load i64, ptr %local.w3
  %t1630 = load i64, ptr %local.u2
  %t1631 = call i64 @"sx_f64_mul"(i64 %t1629, i64 %t1630)
  %t1632 = call i64 @"sx_f64_sub"(i64 %t1628, i64 %t1631)
  %t1633 = call i64 @"sx_f64_mul"(i64 %t1625, i64 %t1632)
  store i64 %t1633, ptr %local.su2.1433
  %t1634 = load i64, ptr %local.sigma
  %t1635 = load i64, ptr %local.w3
  %t1636 = load i64, ptr %local.u2
  %t1637 = call i64 @"sx_f64_mul"(i64 %t1635, i64 %t1636)
  %t1638 = load i64, ptr %local.w2
  %t1639 = load i64, ptr %local.u3
  %t1640 = call i64 @"sx_f64_mul"(i64 %t1638, i64 %t1639)
  %t1641 = call i64 @"sx_f64_sub"(i64 %t1637, i64 %t1640)
  %t1642 = call i64 @"sx_f64_mul"(i64 %t1634, i64 %t1641)
  store i64 %t1642, ptr %local.su3.1434
  %t1643 = load i64, ptr %local.sigma
  %t1644 = load i64, ptr %local.w4
  %t1645 = load i64, ptr %local.u5
  %t1646 = call i64 @"sx_f64_mul"(i64 %t1644, i64 %t1645)
  %t1647 = load i64, ptr %local.w5
  %t1648 = load i64, ptr %local.u4
  %t1649 = call i64 @"sx_f64_mul"(i64 %t1647, i64 %t1648)
  %t1650 = call i64 @"sx_f64_sub"(i64 %t1646, i64 %t1649)
  %t1651 = call i64 @"sx_f64_mul"(i64 %t1643, i64 %t1650)
  store i64 %t1651, ptr %local.su4.1435
  %t1652 = load i64, ptr %local.sigma
  %t1653 = load i64, ptr %local.w5
  %t1654 = load i64, ptr %local.u4
  %t1655 = call i64 @"sx_f64_mul"(i64 %t1653, i64 %t1654)
  %t1656 = load i64, ptr %local.w4
  %t1657 = load i64, ptr %local.u5
  %t1658 = call i64 @"sx_f64_mul"(i64 %t1656, i64 %t1657)
  %t1659 = call i64 @"sx_f64_sub"(i64 %t1655, i64 %t1658)
  %t1660 = call i64 @"sx_f64_mul"(i64 %t1652, i64 %t1659)
  store i64 %t1660, ptr %local.su5.1436
  %t1661 = load i64, ptr %local.sigma
  %t1662 = load i64, ptr %local.w6
  %t1663 = load i64, ptr %local.u7
  %t1664 = call i64 @"sx_f64_mul"(i64 %t1662, i64 %t1663)
  %t1665 = load i64, ptr %local.w7
  %t1666 = load i64, ptr %local.u6
  %t1667 = call i64 @"sx_f64_mul"(i64 %t1665, i64 %t1666)
  %t1668 = call i64 @"sx_f64_sub"(i64 %t1664, i64 %t1667)
  %t1669 = call i64 @"sx_f64_mul"(i64 %t1661, i64 %t1668)
  store i64 %t1669, ptr %local.su6.1437
  %t1670 = load i64, ptr %local.sigma
  %t1671 = load i64, ptr %local.w7
  %t1672 = load i64, ptr %local.u6
  %t1673 = call i64 @"sx_f64_mul"(i64 %t1671, i64 %t1672)
  %t1674 = load i64, ptr %local.w6
  %t1675 = load i64, ptr %local.u7
  %t1676 = call i64 @"sx_f64_mul"(i64 %t1674, i64 %t1675)
  %t1677 = call i64 @"sx_f64_sub"(i64 %t1673, i64 %t1676)
  %t1678 = call i64 @"sx_f64_mul"(i64 %t1670, i64 %t1677)
  store i64 %t1678, ptr %local.su7.1438
  %t1679 = load i64, ptr %local.lambda
  %t1680 = load i64, ptr %local.w1
  %t1681 = load i64, ptr %local.u0
  %t1682 = call i64 @"sx_f64_mul"(i64 %t1680, i64 %t1681)
  %t1683 = load i64, ptr %local.w0
  %t1684 = load i64, ptr %local.u1
  %t1685 = call i64 @"sx_f64_mul"(i64 %t1683, i64 %t1684)
  %t1686 = call i64 @"sx_f64_add"(i64 %t1682, i64 %t1685)
  %t1687 = call i64 @"sx_f64_mul"(i64 %t1679, i64 %t1686)
  store i64 %t1687, ptr %local.vw0.1439
  %t1688 = load i64, ptr %local.lambda
  %t1689 = load i64, ptr %local.w0
  %t1690 = load i64, ptr %local.u1
  %t1691 = call i64 @"sx_f64_mul"(i64 %t1689, i64 %t1690)
  %t1692 = load i64, ptr %local.w1
  %t1693 = load i64, ptr %local.u0
  %t1694 = call i64 @"sx_f64_mul"(i64 %t1692, i64 %t1693)
  %t1695 = call i64 @"sx_f64_add"(i64 %t1691, i64 %t1694)
  %t1696 = call i64 @"sx_f64_mul"(i64 %t1688, i64 %t1695)
  store i64 %t1696, ptr %local.vw1.1440
  %t1697 = load i64, ptr %local.lambda
  %t1698 = load i64, ptr %local.w3
  %t1699 = load i64, ptr %local.u2
  %t1700 = call i64 @"sx_f64_mul"(i64 %t1698, i64 %t1699)
  %t1701 = load i64, ptr %local.w2
  %t1702 = load i64, ptr %local.u3
  %t1703 = call i64 @"sx_f64_mul"(i64 %t1701, i64 %t1702)
  %t1704 = call i64 @"sx_f64_add"(i64 %t1700, i64 %t1703)
  %t1705 = call i64 @"sx_f64_mul"(i64 %t1697, i64 %t1704)
  store i64 %t1705, ptr %local.vw2.1441
  %t1706 = load i64, ptr %local.lambda
  %t1707 = load i64, ptr %local.w2
  %t1708 = load i64, ptr %local.u3
  %t1709 = call i64 @"sx_f64_mul"(i64 %t1707, i64 %t1708)
  %t1710 = load i64, ptr %local.w3
  %t1711 = load i64, ptr %local.u2
  %t1712 = call i64 @"sx_f64_mul"(i64 %t1710, i64 %t1711)
  %t1713 = call i64 @"sx_f64_add"(i64 %t1709, i64 %t1712)
  %t1714 = call i64 @"sx_f64_mul"(i64 %t1706, i64 %t1713)
  store i64 %t1714, ptr %local.vw3.1442
  %t1715 = load i64, ptr %local.lambda
  %t1716 = load i64, ptr %local.w5
  %t1717 = load i64, ptr %local.u4
  %t1718 = call i64 @"sx_f64_mul"(i64 %t1716, i64 %t1717)
  %t1719 = load i64, ptr %local.w4
  %t1720 = load i64, ptr %local.u5
  %t1721 = call i64 @"sx_f64_mul"(i64 %t1719, i64 %t1720)
  %t1722 = call i64 @"sx_f64_add"(i64 %t1718, i64 %t1721)
  %t1723 = call i64 @"sx_f64_mul"(i64 %t1715, i64 %t1722)
  store i64 %t1723, ptr %local.vw4.1443
  %t1724 = load i64, ptr %local.lambda
  %t1725 = load i64, ptr %local.w4
  %t1726 = load i64, ptr %local.u5
  %t1727 = call i64 @"sx_f64_mul"(i64 %t1725, i64 %t1726)
  %t1728 = load i64, ptr %local.w5
  %t1729 = load i64, ptr %local.u4
  %t1730 = call i64 @"sx_f64_mul"(i64 %t1728, i64 %t1729)
  %t1731 = call i64 @"sx_f64_add"(i64 %t1727, i64 %t1730)
  %t1732 = call i64 @"sx_f64_mul"(i64 %t1724, i64 %t1731)
  store i64 %t1732, ptr %local.vw5.1444
  %t1733 = load i64, ptr %local.lambda
  %t1734 = load i64, ptr %local.w7
  %t1735 = load i64, ptr %local.u6
  %t1736 = call i64 @"sx_f64_mul"(i64 %t1734, i64 %t1735)
  %t1737 = load i64, ptr %local.w6
  %t1738 = load i64, ptr %local.u7
  %t1739 = call i64 @"sx_f64_mul"(i64 %t1737, i64 %t1738)
  %t1740 = call i64 @"sx_f64_add"(i64 %t1736, i64 %t1739)
  %t1741 = call i64 @"sx_f64_mul"(i64 %t1733, i64 %t1740)
  store i64 %t1741, ptr %local.vw6.1445
  %t1742 = load i64, ptr %local.lambda
  %t1743 = load i64, ptr %local.w6
  %t1744 = load i64, ptr %local.u7
  %t1745 = call i64 @"sx_f64_mul"(i64 %t1743, i64 %t1744)
  %t1746 = load i64, ptr %local.w7
  %t1747 = load i64, ptr %local.u6
  %t1748 = call i64 @"sx_f64_mul"(i64 %t1746, i64 %t1747)
  %t1749 = call i64 @"sx_f64_add"(i64 %t1745, i64 %t1748)
  %t1750 = call i64 @"sx_f64_mul"(i64 %t1742, i64 %t1749)
  store i64 %t1750, ptr %local.vw7.1446
  %t1751 = load i64, ptr %local.lambda2
  %t1752 = load i64, ptr %local.omega_sq.1414
  %t1753 = call i64 @"sx_f64_mul"(i64 %t1751, i64 %t1752)
  %t1754 = load i64, ptr %local.w0
  %t1755 = call i64 @"sx_f64_mul"(i64 %t1753, i64 %t1754)
  store i64 %t1755, ptr %local.qw0.1447
  %t1756 = load i64, ptr %local.lambda2
  %t1757 = load i64, ptr %local.omega_sq.1414
  %t1758 = call i64 @"sx_f64_mul"(i64 %t1756, i64 %t1757)
  %t1759 = load i64, ptr %local.w1
  %t1760 = call i64 @"sx_f64_mul"(i64 %t1758, i64 %t1759)
  store i64 %t1760, ptr %local.qw1.1448
  %t1761 = load i64, ptr %local.lambda2
  %t1762 = load i64, ptr %local.omega_sq.1414
  %t1763 = call i64 @"sx_f64_mul"(i64 %t1761, i64 %t1762)
  %t1764 = load i64, ptr %local.w2
  %t1765 = call i64 @"sx_f64_mul"(i64 %t1763, i64 %t1764)
  store i64 %t1765, ptr %local.qw2.1449
  %t1766 = load i64, ptr %local.lambda2
  %t1767 = load i64, ptr %local.omega_sq.1414
  %t1768 = call i64 @"sx_f64_mul"(i64 %t1766, i64 %t1767)
  %t1769 = load i64, ptr %local.w3
  %t1770 = call i64 @"sx_f64_mul"(i64 %t1768, i64 %t1769)
  store i64 %t1770, ptr %local.qw3.1450
  %t1771 = load i64, ptr %local.lambda2
  %t1772 = load i64, ptr %local.omega_sq.1414
  %t1773 = call i64 @"sx_f64_mul"(i64 %t1771, i64 %t1772)
  %t1774 = load i64, ptr %local.w4
  %t1775 = call i64 @"sx_f64_mul"(i64 %t1773, i64 %t1774)
  store i64 %t1775, ptr %local.qw4.1451
  %t1776 = load i64, ptr %local.lambda2
  %t1777 = load i64, ptr %local.omega_sq.1414
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1776, i64 %t1777)
  %t1779 = load i64, ptr %local.w5
  %t1780 = call i64 @"sx_f64_mul"(i64 %t1778, i64 %t1779)
  store i64 %t1780, ptr %local.qw5.1452
  %t1781 = load i64, ptr %local.lambda2
  %t1782 = load i64, ptr %local.omega_sq.1414
  %t1783 = call i64 @"sx_f64_mul"(i64 %t1781, i64 %t1782)
  %t1784 = load i64, ptr %local.w6
  %t1785 = call i64 @"sx_f64_mul"(i64 %t1783, i64 %t1784)
  store i64 %t1785, ptr %local.qw6.1453
  %t1786 = load i64, ptr %local.lambda2
  %t1787 = load i64, ptr %local.omega_sq.1414
  %t1788 = call i64 @"sx_f64_mul"(i64 %t1786, i64 %t1787)
  %t1789 = load i64, ptr %local.w7
  %t1790 = call i64 @"sx_f64_mul"(i64 %t1788, i64 %t1789)
  store i64 %t1790, ptr %local.qw7.1454
  %t1791 = load i64, ptr %local.beta
  %t1792 = load i64, ptr %local.w0
  %t1793 = call i64 @"sx_f64_mul"(i64 %t1791, i64 %t1792)
  %t1794 = load i64, ptr %local.w1
  %t1795 = call i64 @"sx_f64_mul"(i64 %t1793, i64 %t1794)
  store i64 %t1795, ptr %local.c_w2.1455
  %t1796 = load i64, ptr %local.beta
  %t1797 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.118)
  %t1798 = load i64, ptr %local.w0
  %t1799 = load i64, ptr %local.w1
  %t1800 = call i64 @"sx_f64_mul"(i64 %t1798, i64 %t1799)
  %t1801 = call i64 @"sx_f64_sub"(i64 %t1797, i64 %t1800)
  %t1802 = call i64 @"sx_f64_mul"(i64 %t1796, i64 %t1801)
  store i64 %t1802, ptr %local.c_w3.1456
  %t1803 = load i64, ptr %local.beta
  %t1804 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.119)
  %t1805 = call i64 @"sx_f64_mul"(i64 %t1803, i64 %t1804)
  %t1806 = load i64, ptr %local.w2
  %t1807 = call i64 @"sx_f64_mul"(i64 %t1805, i64 %t1806)
  %t1808 = load i64, ptr %local.w3
  %t1809 = call i64 @"sx_f64_mul"(i64 %t1807, i64 %t1808)
  store i64 %t1809, ptr %local.c_w4.1457
  %t1810 = load i64, ptr %local.beta
  %t1811 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.120)
  %t1812 = call i64 @"sx_f64_mul"(i64 %t1810, i64 %t1811)
  %t1813 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.121)
  %t1814 = load i64, ptr %local.w2
  %t1815 = load i64, ptr %local.w3
  %t1816 = call i64 @"sx_f64_mul"(i64 %t1814, i64 %t1815)
  %t1817 = call i64 @"sx_f64_sub"(i64 %t1813, i64 %t1816)
  %t1818 = call i64 @"sx_f64_mul"(i64 %t1812, i64 %t1817)
  store i64 %t1818, ptr %local.c_w5.1458
  %t1819 = load i64, ptr %local.beta
  %t1820 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.122)
  %t1821 = call i64 @"sx_f64_mul"(i64 %t1819, i64 %t1820)
  %t1822 = load i64, ptr %local.w4
  %t1823 = call i64 @"sx_f64_mul"(i64 %t1821, i64 %t1822)
  %t1824 = load i64, ptr %local.w5
  %t1825 = call i64 @"sx_f64_mul"(i64 %t1823, i64 %t1824)
  store i64 %t1825, ptr %local.c_w6.1459
  %t1826 = load i64, ptr %local.beta
  %t1827 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.123)
  %t1828 = call i64 @"sx_f64_mul"(i64 %t1826, i64 %t1827)
  %t1829 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.124)
  %t1830 = load i64, ptr %local.w4
  %t1831 = load i64, ptr %local.w5
  %t1832 = call i64 @"sx_f64_mul"(i64 %t1830, i64 %t1831)
  %t1833 = call i64 @"sx_f64_sub"(i64 %t1829, i64 %t1832)
  %t1834 = call i64 @"sx_f64_mul"(i64 %t1828, i64 %t1833)
  store i64 %t1834, ptr %local.c_w7.1460
  %t1835 = load i64, ptr %local.beta
  %t1836 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.125)
  %t1837 = call i64 @"sx_f64_mul"(i64 %t1835, i64 %t1836)
  %t1838 = load i64, ptr %local.w0
  %t1839 = call i64 @"sx_f64_mul"(i64 %t1837, i64 %t1838)
  %t1840 = load i64, ptr %local.w1
  %t1841 = call i64 @"sx_f64_mul"(i64 %t1839, i64 %t1840)
  store i64 %t1841, ptr %local.t_w4.1461
  %t1842 = load i64, ptr %local.beta
  %t1843 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.126)
  %t1844 = call i64 @"sx_f64_mul"(i64 %t1842, i64 %t1843)
  %t1845 = load i64, ptr %local.w0
  %t1846 = call i64 @"sx_f64_mul"(i64 %t1844, i64 %t1845)
  %t1847 = load i64, ptr %local.w1
  %t1848 = call i64 @"sx_f64_mul"(i64 %t1846, i64 %t1847)
  store i64 %t1848, ptr %local.t_w6.1462
  %t1849 = load i64, ptr %local.beta
  %t1850 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.127)
  %t1851 = call i64 @"sx_f64_mul"(i64 %t1849, i64 %t1850)
  %t1852 = load i64, ptr %local.w2
  %t1853 = call i64 @"sx_f64_mul"(i64 %t1851, i64 %t1852)
  %t1854 = load i64, ptr %local.w3
  %t1855 = call i64 @"sx_f64_mul"(i64 %t1853, i64 %t1854)
  store i64 %t1855, ptr %local.t2_w6.1463
  %t1856 = load i64, ptr %local.which
  %t1857 = icmp eq i64 %t1856, 0
  %t1858 = zext i1 %t1857 to i64
  %t1859 = icmp ne i64 %t1858, 0
  br i1 %t1859, label %then35, label %else35
then35:
  %t1860 = load i64, ptr %local.u0
  %t1861 = load i64, ptr %local.dt
  %t1862 = load i64, ptr %local.du0.1415
  %t1863 = load i64, ptr %local.su0.1431
  %t1864 = call i64 @"sx_f64_add"(i64 %t1862, i64 %t1863)
  %t1865 = call i64 @"sx_f64_mul"(i64 %t1861, i64 %t1864)
  %t1866 = call i64 @"sx_f64_add"(i64 %t1860, i64 %t1865)
  ret i64 %t1866
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1867 = phi i64 [ 0, %else35_end ]
  %t1868 = load i64, ptr %local.which
  %t1869 = icmp eq i64 %t1868, 1
  %t1870 = zext i1 %t1869 to i64
  %t1871 = icmp ne i64 %t1870, 0
  br i1 %t1871, label %then36, label %else36
then36:
  %t1872 = load i64, ptr %local.u1
  %t1873 = load i64, ptr %local.dt
  %t1874 = load i64, ptr %local.du1.1416
  %t1875 = load i64, ptr %local.su1.1432
  %t1876 = call i64 @"sx_f64_add"(i64 %t1874, i64 %t1875)
  %t1877 = call i64 @"sx_f64_mul"(i64 %t1873, i64 %t1876)
  %t1878 = call i64 @"sx_f64_add"(i64 %t1872, i64 %t1877)
  ret i64 %t1878
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1879 = phi i64 [ 0, %else36_end ]
  %t1880 = load i64, ptr %local.which
  %t1881 = icmp eq i64 %t1880, 2
  %t1882 = zext i1 %t1881 to i64
  %t1883 = icmp ne i64 %t1882, 0
  br i1 %t1883, label %then37, label %else37
then37:
  %t1884 = load i64, ptr %local.u2
  %t1885 = load i64, ptr %local.dt
  %t1886 = load i64, ptr %local.du2.1417
  %t1887 = load i64, ptr %local.su2.1433
  %t1888 = call i64 @"sx_f64_add"(i64 %t1886, i64 %t1887)
  %t1889 = call i64 @"sx_f64_mul"(i64 %t1885, i64 %t1888)
  %t1890 = call i64 @"sx_f64_add"(i64 %t1884, i64 %t1889)
  ret i64 %t1890
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1891 = phi i64 [ 0, %else37_end ]
  %t1892 = load i64, ptr %local.which
  %t1893 = icmp eq i64 %t1892, 3
  %t1894 = zext i1 %t1893 to i64
  %t1895 = icmp ne i64 %t1894, 0
  br i1 %t1895, label %then38, label %else38
then38:
  %t1896 = load i64, ptr %local.u3
  %t1897 = load i64, ptr %local.dt
  %t1898 = load i64, ptr %local.du3.1418
  %t1899 = load i64, ptr %local.su3.1434
  %t1900 = call i64 @"sx_f64_add"(i64 %t1898, i64 %t1899)
  %t1901 = call i64 @"sx_f64_mul"(i64 %t1897, i64 %t1900)
  %t1902 = call i64 @"sx_f64_add"(i64 %t1896, i64 %t1901)
  ret i64 %t1902
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1903 = phi i64 [ 0, %else38_end ]
  %t1904 = load i64, ptr %local.which
  %t1905 = icmp eq i64 %t1904, 4
  %t1906 = zext i1 %t1905 to i64
  %t1907 = icmp ne i64 %t1906, 0
  br i1 %t1907, label %then39, label %else39
then39:
  %t1908 = load i64, ptr %local.u4
  %t1909 = load i64, ptr %local.dt
  %t1910 = load i64, ptr %local.du4.1419
  %t1911 = load i64, ptr %local.su4.1435
  %t1912 = call i64 @"sx_f64_add"(i64 %t1910, i64 %t1911)
  %t1913 = call i64 @"sx_f64_mul"(i64 %t1909, i64 %t1912)
  %t1914 = call i64 @"sx_f64_add"(i64 %t1908, i64 %t1913)
  ret i64 %t1914
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1915 = phi i64 [ 0, %else39_end ]
  %t1916 = load i64, ptr %local.which
  %t1917 = icmp eq i64 %t1916, 5
  %t1918 = zext i1 %t1917 to i64
  %t1919 = icmp ne i64 %t1918, 0
  br i1 %t1919, label %then40, label %else40
then40:
  %t1920 = load i64, ptr %local.u5
  %t1921 = load i64, ptr %local.dt
  %t1922 = load i64, ptr %local.du5.1420
  %t1923 = load i64, ptr %local.su5.1436
  %t1924 = call i64 @"sx_f64_add"(i64 %t1922, i64 %t1923)
  %t1925 = call i64 @"sx_f64_mul"(i64 %t1921, i64 %t1924)
  %t1926 = call i64 @"sx_f64_add"(i64 %t1920, i64 %t1925)
  ret i64 %t1926
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1927 = phi i64 [ 0, %else40_end ]
  %t1928 = load i64, ptr %local.which
  %t1929 = icmp eq i64 %t1928, 6
  %t1930 = zext i1 %t1929 to i64
  %t1931 = icmp ne i64 %t1930, 0
  br i1 %t1931, label %then41, label %else41
then41:
  %t1932 = load i64, ptr %local.u6
  %t1933 = load i64, ptr %local.dt
  %t1934 = load i64, ptr %local.du6.1421
  %t1935 = load i64, ptr %local.su6.1437
  %t1936 = call i64 @"sx_f64_add"(i64 %t1934, i64 %t1935)
  %t1937 = call i64 @"sx_f64_mul"(i64 %t1933, i64 %t1936)
  %t1938 = call i64 @"sx_f64_add"(i64 %t1932, i64 %t1937)
  ret i64 %t1938
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1939 = phi i64 [ 0, %else41_end ]
  %t1940 = load i64, ptr %local.which
  %t1941 = icmp eq i64 %t1940, 7
  %t1942 = zext i1 %t1941 to i64
  %t1943 = icmp ne i64 %t1942, 0
  br i1 %t1943, label %then42, label %else42
then42:
  %t1944 = load i64, ptr %local.u7
  %t1945 = load i64, ptr %local.dt
  %t1946 = load i64, ptr %local.du7.1422
  %t1947 = load i64, ptr %local.su7.1438
  %t1948 = call i64 @"sx_f64_add"(i64 %t1946, i64 %t1947)
  %t1949 = call i64 @"sx_f64_mul"(i64 %t1945, i64 %t1948)
  %t1950 = call i64 @"sx_f64_add"(i64 %t1944, i64 %t1949)
  ret i64 %t1950
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1951 = phi i64 [ 0, %else42_end ]
  %t1952 = load i64, ptr %local.which
  %t1953 = icmp eq i64 %t1952, 8
  %t1954 = zext i1 %t1953 to i64
  %t1955 = icmp ne i64 %t1954, 0
  br i1 %t1955, label %then43, label %else43
then43:
  %t1956 = load i64, ptr %local.w0
  %t1957 = load i64, ptr %local.dt
  %t1958 = load i64, ptr %local.dw0.1423
  %t1959 = load i64, ptr %local.vw0.1439
  %t1960 = call i64 @"sx_f64_add"(i64 %t1958, i64 %t1959)
  %t1961 = load i64, ptr %local.qw0.1447
  %t1962 = call i64 @"sx_f64_add"(i64 %t1960, i64 %t1961)
  %t1963 = call i64 @"sx_f64_mul"(i64 %t1957, i64 %t1962)
  %t1964 = call i64 @"sx_f64_add"(i64 %t1956, i64 %t1963)
  ret i64 %t1964
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1965 = phi i64 [ 0, %else43_end ]
  %t1966 = load i64, ptr %local.which
  %t1967 = icmp eq i64 %t1966, 9
  %t1968 = zext i1 %t1967 to i64
  %t1969 = icmp ne i64 %t1968, 0
  br i1 %t1969, label %then44, label %else44
then44:
  %t1970 = load i64, ptr %local.w1
  %t1971 = load i64, ptr %local.dt
  %t1972 = load i64, ptr %local.dw1.1424
  %t1973 = load i64, ptr %local.vw1.1440
  %t1974 = call i64 @"sx_f64_add"(i64 %t1972, i64 %t1973)
  %t1975 = load i64, ptr %local.qw1.1448
  %t1976 = call i64 @"sx_f64_add"(i64 %t1974, i64 %t1975)
  %t1977 = call i64 @"sx_f64_mul"(i64 %t1971, i64 %t1976)
  %t1978 = call i64 @"sx_f64_add"(i64 %t1970, i64 %t1977)
  ret i64 %t1978
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1979 = phi i64 [ 0, %else44_end ]
  %t1980 = load i64, ptr %local.which
  %t1981 = icmp eq i64 %t1980, 10
  %t1982 = zext i1 %t1981 to i64
  %t1983 = icmp ne i64 %t1982, 0
  br i1 %t1983, label %then45, label %else45
then45:
  %t1984 = load i64, ptr %local.w2
  %t1985 = load i64, ptr %local.dt
  %t1986 = load i64, ptr %local.dw2.1425
  %t1987 = load i64, ptr %local.vw2.1441
  %t1988 = call i64 @"sx_f64_add"(i64 %t1986, i64 %t1987)
  %t1989 = load i64, ptr %local.qw2.1449
  %t1990 = call i64 @"sx_f64_add"(i64 %t1988, i64 %t1989)
  %t1991 = load i64, ptr %local.c_w2.1455
  %t1992 = call i64 @"sx_f64_add"(i64 %t1990, i64 %t1991)
  %t1993 = call i64 @"sx_f64_mul"(i64 %t1985, i64 %t1992)
  %t1994 = call i64 @"sx_f64_add"(i64 %t1984, i64 %t1993)
  ret i64 %t1994
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1995 = phi i64 [ 0, %else45_end ]
  %t1996 = load i64, ptr %local.which
  %t1997 = icmp eq i64 %t1996, 11
  %t1998 = zext i1 %t1997 to i64
  %t1999 = icmp ne i64 %t1998, 0
  br i1 %t1999, label %then46, label %else46
then46:
  %t2000 = load i64, ptr %local.w3
  %t2001 = load i64, ptr %local.dt
  %t2002 = load i64, ptr %local.dw3.1426
  %t2003 = load i64, ptr %local.vw3.1442
  %t2004 = call i64 @"sx_f64_add"(i64 %t2002, i64 %t2003)
  %t2005 = load i64, ptr %local.qw3.1450
  %t2006 = call i64 @"sx_f64_add"(i64 %t2004, i64 %t2005)
  %t2007 = load i64, ptr %local.c_w3.1456
  %t2008 = call i64 @"sx_f64_add"(i64 %t2006, i64 %t2007)
  %t2009 = call i64 @"sx_f64_mul"(i64 %t2001, i64 %t2008)
  %t2010 = call i64 @"sx_f64_add"(i64 %t2000, i64 %t2009)
  ret i64 %t2010
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t2011 = phi i64 [ 0, %else46_end ]
  %t2012 = load i64, ptr %local.which
  %t2013 = icmp eq i64 %t2012, 12
  %t2014 = zext i1 %t2013 to i64
  %t2015 = icmp ne i64 %t2014, 0
  br i1 %t2015, label %then47, label %else47
then47:
  %t2016 = load i64, ptr %local.w4
  %t2017 = load i64, ptr %local.dt
  %t2018 = load i64, ptr %local.dw4.1427
  %t2019 = load i64, ptr %local.vw4.1443
  %t2020 = call i64 @"sx_f64_add"(i64 %t2018, i64 %t2019)
  %t2021 = load i64, ptr %local.qw4.1451
  %t2022 = call i64 @"sx_f64_add"(i64 %t2020, i64 %t2021)
  %t2023 = load i64, ptr %local.c_w4.1457
  %t2024 = call i64 @"sx_f64_add"(i64 %t2022, i64 %t2023)
  %t2025 = load i64, ptr %local.t_w4.1461
  %t2026 = call i64 @"sx_f64_add"(i64 %t2024, i64 %t2025)
  %t2027 = call i64 @"sx_f64_mul"(i64 %t2017, i64 %t2026)
  %t2028 = call i64 @"sx_f64_add"(i64 %t2016, i64 %t2027)
  ret i64 %t2028
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t2029 = phi i64 [ 0, %else47_end ]
  %t2030 = load i64, ptr %local.which
  %t2031 = icmp eq i64 %t2030, 13
  %t2032 = zext i1 %t2031 to i64
  %t2033 = icmp ne i64 %t2032, 0
  br i1 %t2033, label %then48, label %else48
then48:
  %t2034 = load i64, ptr %local.w5
  %t2035 = load i64, ptr %local.dt
  %t2036 = load i64, ptr %local.dw5.1428
  %t2037 = load i64, ptr %local.vw5.1444
  %t2038 = call i64 @"sx_f64_add"(i64 %t2036, i64 %t2037)
  %t2039 = load i64, ptr %local.qw5.1452
  %t2040 = call i64 @"sx_f64_add"(i64 %t2038, i64 %t2039)
  %t2041 = load i64, ptr %local.c_w5.1458
  %t2042 = call i64 @"sx_f64_add"(i64 %t2040, i64 %t2041)
  %t2043 = call i64 @"sx_f64_mul"(i64 %t2035, i64 %t2042)
  %t2044 = call i64 @"sx_f64_add"(i64 %t2034, i64 %t2043)
  ret i64 %t2044
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t2045 = phi i64 [ 0, %else48_end ]
  %t2046 = load i64, ptr %local.which
  %t2047 = icmp eq i64 %t2046, 14
  %t2048 = zext i1 %t2047 to i64
  %t2049 = icmp ne i64 %t2048, 0
  br i1 %t2049, label %then49, label %else49
then49:
  %t2050 = load i64, ptr %local.w6
  %t2051 = load i64, ptr %local.dt
  %t2052 = load i64, ptr %local.dw6.1429
  %t2053 = load i64, ptr %local.vw6.1445
  %t2054 = call i64 @"sx_f64_add"(i64 %t2052, i64 %t2053)
  %t2055 = load i64, ptr %local.qw6.1453
  %t2056 = call i64 @"sx_f64_add"(i64 %t2054, i64 %t2055)
  %t2057 = load i64, ptr %local.c_w6.1459
  %t2058 = call i64 @"sx_f64_add"(i64 %t2056, i64 %t2057)
  %t2059 = load i64, ptr %local.t_w6.1462
  %t2060 = call i64 @"sx_f64_add"(i64 %t2058, i64 %t2059)
  %t2061 = load i64, ptr %local.t2_w6.1463
  %t2062 = call i64 @"sx_f64_add"(i64 %t2060, i64 %t2061)
  %t2063 = call i64 @"sx_f64_mul"(i64 %t2051, i64 %t2062)
  %t2064 = call i64 @"sx_f64_add"(i64 %t2050, i64 %t2063)
  ret i64 %t2064
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t2065 = phi i64 [ 0, %else49_end ]
  %t2066 = load i64, ptr %local.w7
  %t2067 = load i64, ptr %local.dt
  %t2068 = load i64, ptr %local.dw7.1430
  %t2069 = load i64, ptr %local.vw7.1446
  %t2070 = call i64 @"sx_f64_add"(i64 %t2068, i64 %t2069)
  %t2071 = load i64, ptr %local.qw7.1454
  %t2072 = call i64 @"sx_f64_add"(i64 %t2070, i64 %t2071)
  %t2073 = load i64, ptr %local.c_w7.1460
  %t2074 = call i64 @"sx_f64_add"(i64 %t2072, i64 %t2073)
  %t2075 = call i64 @"sx_f64_mul"(i64 %t2067, i64 %t2074)
  %t2076 = call i64 @"sx_f64_add"(i64 %t2066, i64 %t2075)
  ret i64 %t2076
}

define i64 @"step20"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %u8, i64 %u9, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %w6, i64 %w7, i64 %w8, i64 %w9, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.2077 = alloca i64
  %local.du0.2078 = alloca i64
  %local.du1.2079 = alloca i64
  %local.du2.2080 = alloca i64
  %local.du3.2081 = alloca i64
  %local.du4.2082 = alloca i64
  %local.du5.2083 = alloca i64
  %local.du6.2084 = alloca i64
  %local.du7.2085 = alloca i64
  %local.du8.2086 = alloca i64
  %local.du9.2087 = alloca i64
  %local.dw0.2088 = alloca i64
  %local.dw1.2089 = alloca i64
  %local.dw2.2090 = alloca i64
  %local.dw3.2091 = alloca i64
  %local.dw4.2092 = alloca i64
  %local.dw5.2093 = alloca i64
  %local.dw6.2094 = alloca i64
  %local.dw7.2095 = alloca i64
  %local.dw8.2096 = alloca i64
  %local.dw9.2097 = alloca i64
  %local.su0.2098 = alloca i64
  %local.su1.2099 = alloca i64
  %local.su2.2100 = alloca i64
  %local.su3.2101 = alloca i64
  %local.su4.2102 = alloca i64
  %local.su5.2103 = alloca i64
  %local.su6.2104 = alloca i64
  %local.su7.2105 = alloca i64
  %local.su8.2106 = alloca i64
  %local.su9.2107 = alloca i64
  %local.vw0.2108 = alloca i64
  %local.vw1.2109 = alloca i64
  %local.vw2.2110 = alloca i64
  %local.vw3.2111 = alloca i64
  %local.vw4.2112 = alloca i64
  %local.vw5.2113 = alloca i64
  %local.vw6.2114 = alloca i64
  %local.vw7.2115 = alloca i64
  %local.vw8.2116 = alloca i64
  %local.vw9.2117 = alloca i64
  %local.qw0.2118 = alloca i64
  %local.qw1.2119 = alloca i64
  %local.qw2.2120 = alloca i64
  %local.qw3.2121 = alloca i64
  %local.qw4.2122 = alloca i64
  %local.qw5.2123 = alloca i64
  %local.qw6.2124 = alloca i64
  %local.qw7.2125 = alloca i64
  %local.qw8.2126 = alloca i64
  %local.qw9.2127 = alloca i64
  %local.c_w2.2128 = alloca i64
  %local.c_w3.2129 = alloca i64
  %local.c_w4.2130 = alloca i64
  %local.c_w5.2131 = alloca i64
  %local.c_w6.2132 = alloca i64
  %local.c_w7.2133 = alloca i64
  %local.c_w8.2134 = alloca i64
  %local.c_w9.2135 = alloca i64
  %local.t_w4.2136 = alloca i64
  %local.t_w6.2137 = alloca i64
  %local.t2_w6.2138 = alloca i64
  %local.t_w8.2139 = alloca i64
  %local.t2_w8.2140 = alloca i64
  %local.t3_w8.2141 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.u8 = alloca i64
  store i64 %u8, ptr %local.u8
  %local.u9 = alloca i64
  store i64 %u9, ptr %local.u9
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.w6 = alloca i64
  store i64 %w6, ptr %local.w6
  %local.w7 = alloca i64
  store i64 %w7, ptr %local.w7
  %local.w8 = alloca i64
  store i64 %w8, ptr %local.w8
  %local.w9 = alloca i64
  store i64 %w9, ptr %local.w9
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t2142 = load i64, ptr %local.w0
  %t2143 = load i64, ptr %local.w0
  %t2144 = call i64 @"sx_f64_mul"(i64 %t2142, i64 %t2143)
  %t2145 = load i64, ptr %local.w1
  %t2146 = load i64, ptr %local.w1
  %t2147 = call i64 @"sx_f64_mul"(i64 %t2145, i64 %t2146)
  %t2148 = call i64 @"sx_f64_add"(i64 %t2144, i64 %t2147)
  %t2149 = load i64, ptr %local.w2
  %t2150 = load i64, ptr %local.w2
  %t2151 = call i64 @"sx_f64_mul"(i64 %t2149, i64 %t2150)
  %t2152 = call i64 @"sx_f64_add"(i64 %t2148, i64 %t2151)
  %t2153 = load i64, ptr %local.w3
  %t2154 = load i64, ptr %local.w3
  %t2155 = call i64 @"sx_f64_mul"(i64 %t2153, i64 %t2154)
  %t2156 = call i64 @"sx_f64_add"(i64 %t2152, i64 %t2155)
  %t2157 = load i64, ptr %local.w4
  %t2158 = load i64, ptr %local.w4
  %t2159 = call i64 @"sx_f64_mul"(i64 %t2157, i64 %t2158)
  %t2160 = call i64 @"sx_f64_add"(i64 %t2156, i64 %t2159)
  %t2161 = load i64, ptr %local.w5
  %t2162 = load i64, ptr %local.w5
  %t2163 = call i64 @"sx_f64_mul"(i64 %t2161, i64 %t2162)
  %t2164 = call i64 @"sx_f64_add"(i64 %t2160, i64 %t2163)
  %t2165 = load i64, ptr %local.w6
  %t2166 = load i64, ptr %local.w6
  %t2167 = call i64 @"sx_f64_mul"(i64 %t2165, i64 %t2166)
  %t2168 = call i64 @"sx_f64_add"(i64 %t2164, i64 %t2167)
  %t2169 = load i64, ptr %local.w7
  %t2170 = load i64, ptr %local.w7
  %t2171 = call i64 @"sx_f64_mul"(i64 %t2169, i64 %t2170)
  %t2172 = call i64 @"sx_f64_add"(i64 %t2168, i64 %t2171)
  %t2173 = load i64, ptr %local.w8
  %t2174 = load i64, ptr %local.w8
  %t2175 = call i64 @"sx_f64_mul"(i64 %t2173, i64 %t2174)
  %t2176 = call i64 @"sx_f64_add"(i64 %t2172, i64 %t2175)
  %t2177 = load i64, ptr %local.w9
  %t2178 = load i64, ptr %local.w9
  %t2179 = call i64 @"sx_f64_mul"(i64 %t2177, i64 %t2178)
  %t2180 = call i64 @"sx_f64_add"(i64 %t2176, i64 %t2179)
  store i64 %t2180, ptr %local.omega_sq.2077
  %t2181 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.128)
  %t2182 = load i64, ptr %local.nu
  %t2183 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.129)
  %t2184 = call i64 @"sx_f64_mul"(i64 %t2182, i64 %t2183)
  %t2185 = load i64, ptr %local.u0
  %t2186 = call i64 @"sx_f64_mul"(i64 %t2184, i64 %t2185)
  %t2187 = call i64 @"sx_f64_sub"(i64 %t2181, i64 %t2186)
  store i64 %t2187, ptr %local.du0.2078
  %t2188 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.130)
  %t2189 = load i64, ptr %local.nu
  %t2190 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.131)
  %t2191 = call i64 @"sx_f64_mul"(i64 %t2189, i64 %t2190)
  %t2192 = load i64, ptr %local.u1
  %t2193 = call i64 @"sx_f64_mul"(i64 %t2191, i64 %t2192)
  %t2194 = call i64 @"sx_f64_sub"(i64 %t2188, i64 %t2193)
  store i64 %t2194, ptr %local.du1.2079
  %t2195 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.132)
  %t2196 = load i64, ptr %local.nu
  %t2197 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.133)
  %t2198 = call i64 @"sx_f64_mul"(i64 %t2196, i64 %t2197)
  %t2199 = load i64, ptr %local.u2
  %t2200 = call i64 @"sx_f64_mul"(i64 %t2198, i64 %t2199)
  %t2201 = call i64 @"sx_f64_sub"(i64 %t2195, i64 %t2200)
  store i64 %t2201, ptr %local.du2.2080
  %t2202 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.134)
  %t2203 = load i64, ptr %local.nu
  %t2204 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.135)
  %t2205 = call i64 @"sx_f64_mul"(i64 %t2203, i64 %t2204)
  %t2206 = load i64, ptr %local.u3
  %t2207 = call i64 @"sx_f64_mul"(i64 %t2205, i64 %t2206)
  %t2208 = call i64 @"sx_f64_sub"(i64 %t2202, i64 %t2207)
  store i64 %t2208, ptr %local.du3.2081
  %t2209 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.136)
  %t2210 = load i64, ptr %local.nu
  %t2211 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.137)
  %t2212 = call i64 @"sx_f64_mul"(i64 %t2210, i64 %t2211)
  %t2213 = load i64, ptr %local.u4
  %t2214 = call i64 @"sx_f64_mul"(i64 %t2212, i64 %t2213)
  %t2215 = call i64 @"sx_f64_sub"(i64 %t2209, i64 %t2214)
  store i64 %t2215, ptr %local.du4.2082
  %t2216 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.138)
  %t2217 = load i64, ptr %local.nu
  %t2218 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.139)
  %t2219 = call i64 @"sx_f64_mul"(i64 %t2217, i64 %t2218)
  %t2220 = load i64, ptr %local.u5
  %t2221 = call i64 @"sx_f64_mul"(i64 %t2219, i64 %t2220)
  %t2222 = call i64 @"sx_f64_sub"(i64 %t2216, i64 %t2221)
  store i64 %t2222, ptr %local.du5.2083
  %t2223 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.140)
  %t2224 = load i64, ptr %local.nu
  %t2225 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.141)
  %t2226 = call i64 @"sx_f64_mul"(i64 %t2224, i64 %t2225)
  %t2227 = load i64, ptr %local.u6
  %t2228 = call i64 @"sx_f64_mul"(i64 %t2226, i64 %t2227)
  %t2229 = call i64 @"sx_f64_sub"(i64 %t2223, i64 %t2228)
  store i64 %t2229, ptr %local.du6.2084
  %t2230 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.142)
  %t2231 = load i64, ptr %local.nu
  %t2232 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.143)
  %t2233 = call i64 @"sx_f64_mul"(i64 %t2231, i64 %t2232)
  %t2234 = load i64, ptr %local.u7
  %t2235 = call i64 @"sx_f64_mul"(i64 %t2233, i64 %t2234)
  %t2236 = call i64 @"sx_f64_sub"(i64 %t2230, i64 %t2235)
  store i64 %t2236, ptr %local.du7.2085
  %t2237 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.144)
  %t2238 = load i64, ptr %local.nu
  %t2239 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.145)
  %t2240 = call i64 @"sx_f64_mul"(i64 %t2238, i64 %t2239)
  %t2241 = load i64, ptr %local.u8
  %t2242 = call i64 @"sx_f64_mul"(i64 %t2240, i64 %t2241)
  %t2243 = call i64 @"sx_f64_sub"(i64 %t2237, i64 %t2242)
  store i64 %t2243, ptr %local.du8.2086
  %t2244 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.146)
  %t2245 = load i64, ptr %local.nu
  %t2246 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.147)
  %t2247 = call i64 @"sx_f64_mul"(i64 %t2245, i64 %t2246)
  %t2248 = load i64, ptr %local.u9
  %t2249 = call i64 @"sx_f64_mul"(i64 %t2247, i64 %t2248)
  %t2250 = call i64 @"sx_f64_sub"(i64 %t2244, i64 %t2249)
  store i64 %t2250, ptr %local.du9.2087
  %t2251 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.148)
  %t2252 = load i64, ptr %local.nu
  %t2253 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.149)
  %t2254 = call i64 @"sx_f64_mul"(i64 %t2252, i64 %t2253)
  %t2255 = load i64, ptr %local.w0
  %t2256 = call i64 @"sx_f64_mul"(i64 %t2254, i64 %t2255)
  %t2257 = call i64 @"sx_f64_sub"(i64 %t2251, i64 %t2256)
  store i64 %t2257, ptr %local.dw0.2088
  %t2258 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.150)
  %t2259 = load i64, ptr %local.nu
  %t2260 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.151)
  %t2261 = call i64 @"sx_f64_mul"(i64 %t2259, i64 %t2260)
  %t2262 = load i64, ptr %local.w1
  %t2263 = call i64 @"sx_f64_mul"(i64 %t2261, i64 %t2262)
  %t2264 = call i64 @"sx_f64_sub"(i64 %t2258, i64 %t2263)
  store i64 %t2264, ptr %local.dw1.2089
  %t2265 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.152)
  %t2266 = load i64, ptr %local.nu
  %t2267 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.153)
  %t2268 = call i64 @"sx_f64_mul"(i64 %t2266, i64 %t2267)
  %t2269 = load i64, ptr %local.w2
  %t2270 = call i64 @"sx_f64_mul"(i64 %t2268, i64 %t2269)
  %t2271 = call i64 @"sx_f64_sub"(i64 %t2265, i64 %t2270)
  store i64 %t2271, ptr %local.dw2.2090
  %t2272 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.154)
  %t2273 = load i64, ptr %local.nu
  %t2274 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.155)
  %t2275 = call i64 @"sx_f64_mul"(i64 %t2273, i64 %t2274)
  %t2276 = load i64, ptr %local.w3
  %t2277 = call i64 @"sx_f64_mul"(i64 %t2275, i64 %t2276)
  %t2278 = call i64 @"sx_f64_sub"(i64 %t2272, i64 %t2277)
  store i64 %t2278, ptr %local.dw3.2091
  %t2279 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.156)
  %t2280 = load i64, ptr %local.nu
  %t2281 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.157)
  %t2282 = call i64 @"sx_f64_mul"(i64 %t2280, i64 %t2281)
  %t2283 = load i64, ptr %local.w4
  %t2284 = call i64 @"sx_f64_mul"(i64 %t2282, i64 %t2283)
  %t2285 = call i64 @"sx_f64_sub"(i64 %t2279, i64 %t2284)
  store i64 %t2285, ptr %local.dw4.2092
  %t2286 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.158)
  %t2287 = load i64, ptr %local.nu
  %t2288 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.159)
  %t2289 = call i64 @"sx_f64_mul"(i64 %t2287, i64 %t2288)
  %t2290 = load i64, ptr %local.w5
  %t2291 = call i64 @"sx_f64_mul"(i64 %t2289, i64 %t2290)
  %t2292 = call i64 @"sx_f64_sub"(i64 %t2286, i64 %t2291)
  store i64 %t2292, ptr %local.dw5.2093
  %t2293 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.160)
  %t2294 = load i64, ptr %local.nu
  %t2295 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.161)
  %t2296 = call i64 @"sx_f64_mul"(i64 %t2294, i64 %t2295)
  %t2297 = load i64, ptr %local.w6
  %t2298 = call i64 @"sx_f64_mul"(i64 %t2296, i64 %t2297)
  %t2299 = call i64 @"sx_f64_sub"(i64 %t2293, i64 %t2298)
  store i64 %t2299, ptr %local.dw6.2094
  %t2300 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.162)
  %t2301 = load i64, ptr %local.nu
  %t2302 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.163)
  %t2303 = call i64 @"sx_f64_mul"(i64 %t2301, i64 %t2302)
  %t2304 = load i64, ptr %local.w7
  %t2305 = call i64 @"sx_f64_mul"(i64 %t2303, i64 %t2304)
  %t2306 = call i64 @"sx_f64_sub"(i64 %t2300, i64 %t2305)
  store i64 %t2306, ptr %local.dw7.2095
  %t2307 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.164)
  %t2308 = load i64, ptr %local.nu
  %t2309 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.165)
  %t2310 = call i64 @"sx_f64_mul"(i64 %t2308, i64 %t2309)
  %t2311 = load i64, ptr %local.w8
  %t2312 = call i64 @"sx_f64_mul"(i64 %t2310, i64 %t2311)
  %t2313 = call i64 @"sx_f64_sub"(i64 %t2307, i64 %t2312)
  store i64 %t2313, ptr %local.dw8.2096
  %t2314 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.166)
  %t2315 = load i64, ptr %local.nu
  %t2316 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.167)
  %t2317 = call i64 @"sx_f64_mul"(i64 %t2315, i64 %t2316)
  %t2318 = load i64, ptr %local.w9
  %t2319 = call i64 @"sx_f64_mul"(i64 %t2317, i64 %t2318)
  %t2320 = call i64 @"sx_f64_sub"(i64 %t2314, i64 %t2319)
  store i64 %t2320, ptr %local.dw9.2097
  %t2321 = load i64, ptr %local.sigma
  %t2322 = load i64, ptr %local.w0
  %t2323 = load i64, ptr %local.u1
  %t2324 = call i64 @"sx_f64_mul"(i64 %t2322, i64 %t2323)
  %t2325 = load i64, ptr %local.w1
  %t2326 = load i64, ptr %local.u0
  %t2327 = call i64 @"sx_f64_mul"(i64 %t2325, i64 %t2326)
  %t2328 = call i64 @"sx_f64_sub"(i64 %t2324, i64 %t2327)
  %t2329 = call i64 @"sx_f64_mul"(i64 %t2321, i64 %t2328)
  store i64 %t2329, ptr %local.su0.2098
  %t2330 = load i64, ptr %local.sigma
  %t2331 = load i64, ptr %local.w1
  %t2332 = load i64, ptr %local.u0
  %t2333 = call i64 @"sx_f64_mul"(i64 %t2331, i64 %t2332)
  %t2334 = load i64, ptr %local.w0
  %t2335 = load i64, ptr %local.u1
  %t2336 = call i64 @"sx_f64_mul"(i64 %t2334, i64 %t2335)
  %t2337 = call i64 @"sx_f64_sub"(i64 %t2333, i64 %t2336)
  %t2338 = call i64 @"sx_f64_mul"(i64 %t2330, i64 %t2337)
  store i64 %t2338, ptr %local.su1.2099
  %t2339 = load i64, ptr %local.sigma
  %t2340 = load i64, ptr %local.w2
  %t2341 = load i64, ptr %local.u3
  %t2342 = call i64 @"sx_f64_mul"(i64 %t2340, i64 %t2341)
  %t2343 = load i64, ptr %local.w3
  %t2344 = load i64, ptr %local.u2
  %t2345 = call i64 @"sx_f64_mul"(i64 %t2343, i64 %t2344)
  %t2346 = call i64 @"sx_f64_sub"(i64 %t2342, i64 %t2345)
  %t2347 = call i64 @"sx_f64_mul"(i64 %t2339, i64 %t2346)
  store i64 %t2347, ptr %local.su2.2100
  %t2348 = load i64, ptr %local.sigma
  %t2349 = load i64, ptr %local.w3
  %t2350 = load i64, ptr %local.u2
  %t2351 = call i64 @"sx_f64_mul"(i64 %t2349, i64 %t2350)
  %t2352 = load i64, ptr %local.w2
  %t2353 = load i64, ptr %local.u3
  %t2354 = call i64 @"sx_f64_mul"(i64 %t2352, i64 %t2353)
  %t2355 = call i64 @"sx_f64_sub"(i64 %t2351, i64 %t2354)
  %t2356 = call i64 @"sx_f64_mul"(i64 %t2348, i64 %t2355)
  store i64 %t2356, ptr %local.su3.2101
  %t2357 = load i64, ptr %local.sigma
  %t2358 = load i64, ptr %local.w4
  %t2359 = load i64, ptr %local.u5
  %t2360 = call i64 @"sx_f64_mul"(i64 %t2358, i64 %t2359)
  %t2361 = load i64, ptr %local.w5
  %t2362 = load i64, ptr %local.u4
  %t2363 = call i64 @"sx_f64_mul"(i64 %t2361, i64 %t2362)
  %t2364 = call i64 @"sx_f64_sub"(i64 %t2360, i64 %t2363)
  %t2365 = call i64 @"sx_f64_mul"(i64 %t2357, i64 %t2364)
  store i64 %t2365, ptr %local.su4.2102
  %t2366 = load i64, ptr %local.sigma
  %t2367 = load i64, ptr %local.w5
  %t2368 = load i64, ptr %local.u4
  %t2369 = call i64 @"sx_f64_mul"(i64 %t2367, i64 %t2368)
  %t2370 = load i64, ptr %local.w4
  %t2371 = load i64, ptr %local.u5
  %t2372 = call i64 @"sx_f64_mul"(i64 %t2370, i64 %t2371)
  %t2373 = call i64 @"sx_f64_sub"(i64 %t2369, i64 %t2372)
  %t2374 = call i64 @"sx_f64_mul"(i64 %t2366, i64 %t2373)
  store i64 %t2374, ptr %local.su5.2103
  %t2375 = load i64, ptr %local.sigma
  %t2376 = load i64, ptr %local.w6
  %t2377 = load i64, ptr %local.u7
  %t2378 = call i64 @"sx_f64_mul"(i64 %t2376, i64 %t2377)
  %t2379 = load i64, ptr %local.w7
  %t2380 = load i64, ptr %local.u6
  %t2381 = call i64 @"sx_f64_mul"(i64 %t2379, i64 %t2380)
  %t2382 = call i64 @"sx_f64_sub"(i64 %t2378, i64 %t2381)
  %t2383 = call i64 @"sx_f64_mul"(i64 %t2375, i64 %t2382)
  store i64 %t2383, ptr %local.su6.2104
  %t2384 = load i64, ptr %local.sigma
  %t2385 = load i64, ptr %local.w7
  %t2386 = load i64, ptr %local.u6
  %t2387 = call i64 @"sx_f64_mul"(i64 %t2385, i64 %t2386)
  %t2388 = load i64, ptr %local.w6
  %t2389 = load i64, ptr %local.u7
  %t2390 = call i64 @"sx_f64_mul"(i64 %t2388, i64 %t2389)
  %t2391 = call i64 @"sx_f64_sub"(i64 %t2387, i64 %t2390)
  %t2392 = call i64 @"sx_f64_mul"(i64 %t2384, i64 %t2391)
  store i64 %t2392, ptr %local.su7.2105
  %t2393 = load i64, ptr %local.sigma
  %t2394 = load i64, ptr %local.w8
  %t2395 = load i64, ptr %local.u9
  %t2396 = call i64 @"sx_f64_mul"(i64 %t2394, i64 %t2395)
  %t2397 = load i64, ptr %local.w9
  %t2398 = load i64, ptr %local.u8
  %t2399 = call i64 @"sx_f64_mul"(i64 %t2397, i64 %t2398)
  %t2400 = call i64 @"sx_f64_sub"(i64 %t2396, i64 %t2399)
  %t2401 = call i64 @"sx_f64_mul"(i64 %t2393, i64 %t2400)
  store i64 %t2401, ptr %local.su8.2106
  %t2402 = load i64, ptr %local.sigma
  %t2403 = load i64, ptr %local.w9
  %t2404 = load i64, ptr %local.u8
  %t2405 = call i64 @"sx_f64_mul"(i64 %t2403, i64 %t2404)
  %t2406 = load i64, ptr %local.w8
  %t2407 = load i64, ptr %local.u9
  %t2408 = call i64 @"sx_f64_mul"(i64 %t2406, i64 %t2407)
  %t2409 = call i64 @"sx_f64_sub"(i64 %t2405, i64 %t2408)
  %t2410 = call i64 @"sx_f64_mul"(i64 %t2402, i64 %t2409)
  store i64 %t2410, ptr %local.su9.2107
  %t2411 = load i64, ptr %local.lambda
  %t2412 = load i64, ptr %local.w1
  %t2413 = load i64, ptr %local.u0
  %t2414 = call i64 @"sx_f64_mul"(i64 %t2412, i64 %t2413)
  %t2415 = load i64, ptr %local.w0
  %t2416 = load i64, ptr %local.u1
  %t2417 = call i64 @"sx_f64_mul"(i64 %t2415, i64 %t2416)
  %t2418 = call i64 @"sx_f64_add"(i64 %t2414, i64 %t2417)
  %t2419 = call i64 @"sx_f64_mul"(i64 %t2411, i64 %t2418)
  store i64 %t2419, ptr %local.vw0.2108
  %t2420 = load i64, ptr %local.lambda
  %t2421 = load i64, ptr %local.w0
  %t2422 = load i64, ptr %local.u1
  %t2423 = call i64 @"sx_f64_mul"(i64 %t2421, i64 %t2422)
  %t2424 = load i64, ptr %local.w1
  %t2425 = load i64, ptr %local.u0
  %t2426 = call i64 @"sx_f64_mul"(i64 %t2424, i64 %t2425)
  %t2427 = call i64 @"sx_f64_add"(i64 %t2423, i64 %t2426)
  %t2428 = call i64 @"sx_f64_mul"(i64 %t2420, i64 %t2427)
  store i64 %t2428, ptr %local.vw1.2109
  %t2429 = load i64, ptr %local.lambda
  %t2430 = load i64, ptr %local.w3
  %t2431 = load i64, ptr %local.u2
  %t2432 = call i64 @"sx_f64_mul"(i64 %t2430, i64 %t2431)
  %t2433 = load i64, ptr %local.w2
  %t2434 = load i64, ptr %local.u3
  %t2435 = call i64 @"sx_f64_mul"(i64 %t2433, i64 %t2434)
  %t2436 = call i64 @"sx_f64_add"(i64 %t2432, i64 %t2435)
  %t2437 = call i64 @"sx_f64_mul"(i64 %t2429, i64 %t2436)
  store i64 %t2437, ptr %local.vw2.2110
  %t2438 = load i64, ptr %local.lambda
  %t2439 = load i64, ptr %local.w2
  %t2440 = load i64, ptr %local.u3
  %t2441 = call i64 @"sx_f64_mul"(i64 %t2439, i64 %t2440)
  %t2442 = load i64, ptr %local.w3
  %t2443 = load i64, ptr %local.u2
  %t2444 = call i64 @"sx_f64_mul"(i64 %t2442, i64 %t2443)
  %t2445 = call i64 @"sx_f64_add"(i64 %t2441, i64 %t2444)
  %t2446 = call i64 @"sx_f64_mul"(i64 %t2438, i64 %t2445)
  store i64 %t2446, ptr %local.vw3.2111
  %t2447 = load i64, ptr %local.lambda
  %t2448 = load i64, ptr %local.w5
  %t2449 = load i64, ptr %local.u4
  %t2450 = call i64 @"sx_f64_mul"(i64 %t2448, i64 %t2449)
  %t2451 = load i64, ptr %local.w4
  %t2452 = load i64, ptr %local.u5
  %t2453 = call i64 @"sx_f64_mul"(i64 %t2451, i64 %t2452)
  %t2454 = call i64 @"sx_f64_add"(i64 %t2450, i64 %t2453)
  %t2455 = call i64 @"sx_f64_mul"(i64 %t2447, i64 %t2454)
  store i64 %t2455, ptr %local.vw4.2112
  %t2456 = load i64, ptr %local.lambda
  %t2457 = load i64, ptr %local.w4
  %t2458 = load i64, ptr %local.u5
  %t2459 = call i64 @"sx_f64_mul"(i64 %t2457, i64 %t2458)
  %t2460 = load i64, ptr %local.w5
  %t2461 = load i64, ptr %local.u4
  %t2462 = call i64 @"sx_f64_mul"(i64 %t2460, i64 %t2461)
  %t2463 = call i64 @"sx_f64_add"(i64 %t2459, i64 %t2462)
  %t2464 = call i64 @"sx_f64_mul"(i64 %t2456, i64 %t2463)
  store i64 %t2464, ptr %local.vw5.2113
  %t2465 = load i64, ptr %local.lambda
  %t2466 = load i64, ptr %local.w7
  %t2467 = load i64, ptr %local.u6
  %t2468 = call i64 @"sx_f64_mul"(i64 %t2466, i64 %t2467)
  %t2469 = load i64, ptr %local.w6
  %t2470 = load i64, ptr %local.u7
  %t2471 = call i64 @"sx_f64_mul"(i64 %t2469, i64 %t2470)
  %t2472 = call i64 @"sx_f64_add"(i64 %t2468, i64 %t2471)
  %t2473 = call i64 @"sx_f64_mul"(i64 %t2465, i64 %t2472)
  store i64 %t2473, ptr %local.vw6.2114
  %t2474 = load i64, ptr %local.lambda
  %t2475 = load i64, ptr %local.w6
  %t2476 = load i64, ptr %local.u7
  %t2477 = call i64 @"sx_f64_mul"(i64 %t2475, i64 %t2476)
  %t2478 = load i64, ptr %local.w7
  %t2479 = load i64, ptr %local.u6
  %t2480 = call i64 @"sx_f64_mul"(i64 %t2478, i64 %t2479)
  %t2481 = call i64 @"sx_f64_add"(i64 %t2477, i64 %t2480)
  %t2482 = call i64 @"sx_f64_mul"(i64 %t2474, i64 %t2481)
  store i64 %t2482, ptr %local.vw7.2115
  %t2483 = load i64, ptr %local.lambda
  %t2484 = load i64, ptr %local.w9
  %t2485 = load i64, ptr %local.u8
  %t2486 = call i64 @"sx_f64_mul"(i64 %t2484, i64 %t2485)
  %t2487 = load i64, ptr %local.w8
  %t2488 = load i64, ptr %local.u9
  %t2489 = call i64 @"sx_f64_mul"(i64 %t2487, i64 %t2488)
  %t2490 = call i64 @"sx_f64_add"(i64 %t2486, i64 %t2489)
  %t2491 = call i64 @"sx_f64_mul"(i64 %t2483, i64 %t2490)
  store i64 %t2491, ptr %local.vw8.2116
  %t2492 = load i64, ptr %local.lambda
  %t2493 = load i64, ptr %local.w8
  %t2494 = load i64, ptr %local.u9
  %t2495 = call i64 @"sx_f64_mul"(i64 %t2493, i64 %t2494)
  %t2496 = load i64, ptr %local.w9
  %t2497 = load i64, ptr %local.u8
  %t2498 = call i64 @"sx_f64_mul"(i64 %t2496, i64 %t2497)
  %t2499 = call i64 @"sx_f64_add"(i64 %t2495, i64 %t2498)
  %t2500 = call i64 @"sx_f64_mul"(i64 %t2492, i64 %t2499)
  store i64 %t2500, ptr %local.vw9.2117
  %t2501 = load i64, ptr %local.lambda2
  %t2502 = load i64, ptr %local.omega_sq.2077
  %t2503 = call i64 @"sx_f64_mul"(i64 %t2501, i64 %t2502)
  %t2504 = load i64, ptr %local.w0
  %t2505 = call i64 @"sx_f64_mul"(i64 %t2503, i64 %t2504)
  store i64 %t2505, ptr %local.qw0.2118
  %t2506 = load i64, ptr %local.lambda2
  %t2507 = load i64, ptr %local.omega_sq.2077
  %t2508 = call i64 @"sx_f64_mul"(i64 %t2506, i64 %t2507)
  %t2509 = load i64, ptr %local.w1
  %t2510 = call i64 @"sx_f64_mul"(i64 %t2508, i64 %t2509)
  store i64 %t2510, ptr %local.qw1.2119
  %t2511 = load i64, ptr %local.lambda2
  %t2512 = load i64, ptr %local.omega_sq.2077
  %t2513 = call i64 @"sx_f64_mul"(i64 %t2511, i64 %t2512)
  %t2514 = load i64, ptr %local.w2
  %t2515 = call i64 @"sx_f64_mul"(i64 %t2513, i64 %t2514)
  store i64 %t2515, ptr %local.qw2.2120
  %t2516 = load i64, ptr %local.lambda2
  %t2517 = load i64, ptr %local.omega_sq.2077
  %t2518 = call i64 @"sx_f64_mul"(i64 %t2516, i64 %t2517)
  %t2519 = load i64, ptr %local.w3
  %t2520 = call i64 @"sx_f64_mul"(i64 %t2518, i64 %t2519)
  store i64 %t2520, ptr %local.qw3.2121
  %t2521 = load i64, ptr %local.lambda2
  %t2522 = load i64, ptr %local.omega_sq.2077
  %t2523 = call i64 @"sx_f64_mul"(i64 %t2521, i64 %t2522)
  %t2524 = load i64, ptr %local.w4
  %t2525 = call i64 @"sx_f64_mul"(i64 %t2523, i64 %t2524)
  store i64 %t2525, ptr %local.qw4.2122
  %t2526 = load i64, ptr %local.lambda2
  %t2527 = load i64, ptr %local.omega_sq.2077
  %t2528 = call i64 @"sx_f64_mul"(i64 %t2526, i64 %t2527)
  %t2529 = load i64, ptr %local.w5
  %t2530 = call i64 @"sx_f64_mul"(i64 %t2528, i64 %t2529)
  store i64 %t2530, ptr %local.qw5.2123
  %t2531 = load i64, ptr %local.lambda2
  %t2532 = load i64, ptr %local.omega_sq.2077
  %t2533 = call i64 @"sx_f64_mul"(i64 %t2531, i64 %t2532)
  %t2534 = load i64, ptr %local.w6
  %t2535 = call i64 @"sx_f64_mul"(i64 %t2533, i64 %t2534)
  store i64 %t2535, ptr %local.qw6.2124
  %t2536 = load i64, ptr %local.lambda2
  %t2537 = load i64, ptr %local.omega_sq.2077
  %t2538 = call i64 @"sx_f64_mul"(i64 %t2536, i64 %t2537)
  %t2539 = load i64, ptr %local.w7
  %t2540 = call i64 @"sx_f64_mul"(i64 %t2538, i64 %t2539)
  store i64 %t2540, ptr %local.qw7.2125
  %t2541 = load i64, ptr %local.lambda2
  %t2542 = load i64, ptr %local.omega_sq.2077
  %t2543 = call i64 @"sx_f64_mul"(i64 %t2541, i64 %t2542)
  %t2544 = load i64, ptr %local.w8
  %t2545 = call i64 @"sx_f64_mul"(i64 %t2543, i64 %t2544)
  store i64 %t2545, ptr %local.qw8.2126
  %t2546 = load i64, ptr %local.lambda2
  %t2547 = load i64, ptr %local.omega_sq.2077
  %t2548 = call i64 @"sx_f64_mul"(i64 %t2546, i64 %t2547)
  %t2549 = load i64, ptr %local.w9
  %t2550 = call i64 @"sx_f64_mul"(i64 %t2548, i64 %t2549)
  store i64 %t2550, ptr %local.qw9.2127
  %t2551 = load i64, ptr %local.beta
  %t2552 = load i64, ptr %local.w0
  %t2553 = call i64 @"sx_f64_mul"(i64 %t2551, i64 %t2552)
  %t2554 = load i64, ptr %local.w1
  %t2555 = call i64 @"sx_f64_mul"(i64 %t2553, i64 %t2554)
  store i64 %t2555, ptr %local.c_w2.2128
  %t2556 = load i64, ptr %local.beta
  %t2557 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.168)
  %t2558 = load i64, ptr %local.w0
  %t2559 = load i64, ptr %local.w1
  %t2560 = call i64 @"sx_f64_mul"(i64 %t2558, i64 %t2559)
  %t2561 = call i64 @"sx_f64_sub"(i64 %t2557, i64 %t2560)
  %t2562 = call i64 @"sx_f64_mul"(i64 %t2556, i64 %t2561)
  store i64 %t2562, ptr %local.c_w3.2129
  %t2563 = load i64, ptr %local.beta
  %t2564 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.169)
  %t2565 = call i64 @"sx_f64_mul"(i64 %t2563, i64 %t2564)
  %t2566 = load i64, ptr %local.w2
  %t2567 = call i64 @"sx_f64_mul"(i64 %t2565, i64 %t2566)
  %t2568 = load i64, ptr %local.w3
  %t2569 = call i64 @"sx_f64_mul"(i64 %t2567, i64 %t2568)
  store i64 %t2569, ptr %local.c_w4.2130
  %t2570 = load i64, ptr %local.beta
  %t2571 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.170)
  %t2572 = call i64 @"sx_f64_mul"(i64 %t2570, i64 %t2571)
  %t2573 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.171)
  %t2574 = load i64, ptr %local.w2
  %t2575 = load i64, ptr %local.w3
  %t2576 = call i64 @"sx_f64_mul"(i64 %t2574, i64 %t2575)
  %t2577 = call i64 @"sx_f64_sub"(i64 %t2573, i64 %t2576)
  %t2578 = call i64 @"sx_f64_mul"(i64 %t2572, i64 %t2577)
  store i64 %t2578, ptr %local.c_w5.2131
  %t2579 = load i64, ptr %local.beta
  %t2580 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.172)
  %t2581 = call i64 @"sx_f64_mul"(i64 %t2579, i64 %t2580)
  %t2582 = load i64, ptr %local.w4
  %t2583 = call i64 @"sx_f64_mul"(i64 %t2581, i64 %t2582)
  %t2584 = load i64, ptr %local.w5
  %t2585 = call i64 @"sx_f64_mul"(i64 %t2583, i64 %t2584)
  store i64 %t2585, ptr %local.c_w6.2132
  %t2586 = load i64, ptr %local.beta
  %t2587 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.173)
  %t2588 = call i64 @"sx_f64_mul"(i64 %t2586, i64 %t2587)
  %t2589 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.174)
  %t2590 = load i64, ptr %local.w4
  %t2591 = load i64, ptr %local.w5
  %t2592 = call i64 @"sx_f64_mul"(i64 %t2590, i64 %t2591)
  %t2593 = call i64 @"sx_f64_sub"(i64 %t2589, i64 %t2592)
  %t2594 = call i64 @"sx_f64_mul"(i64 %t2588, i64 %t2593)
  store i64 %t2594, ptr %local.c_w7.2133
  %t2595 = load i64, ptr %local.beta
  %t2596 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.175)
  %t2597 = call i64 @"sx_f64_mul"(i64 %t2595, i64 %t2596)
  %t2598 = load i64, ptr %local.w6
  %t2599 = call i64 @"sx_f64_mul"(i64 %t2597, i64 %t2598)
  %t2600 = load i64, ptr %local.w7
  %t2601 = call i64 @"sx_f64_mul"(i64 %t2599, i64 %t2600)
  store i64 %t2601, ptr %local.c_w8.2134
  %t2602 = load i64, ptr %local.beta
  %t2603 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.176)
  %t2604 = call i64 @"sx_f64_mul"(i64 %t2602, i64 %t2603)
  %t2605 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.177)
  %t2606 = load i64, ptr %local.w6
  %t2607 = load i64, ptr %local.w7
  %t2608 = call i64 @"sx_f64_mul"(i64 %t2606, i64 %t2607)
  %t2609 = call i64 @"sx_f64_sub"(i64 %t2605, i64 %t2608)
  %t2610 = call i64 @"sx_f64_mul"(i64 %t2604, i64 %t2609)
  store i64 %t2610, ptr %local.c_w9.2135
  %t2611 = load i64, ptr %local.beta
  %t2612 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.178)
  %t2613 = call i64 @"sx_f64_mul"(i64 %t2611, i64 %t2612)
  %t2614 = load i64, ptr %local.w0
  %t2615 = call i64 @"sx_f64_mul"(i64 %t2613, i64 %t2614)
  %t2616 = load i64, ptr %local.w1
  %t2617 = call i64 @"sx_f64_mul"(i64 %t2615, i64 %t2616)
  store i64 %t2617, ptr %local.t_w4.2136
  %t2618 = load i64, ptr %local.beta
  %t2619 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.179)
  %t2620 = call i64 @"sx_f64_mul"(i64 %t2618, i64 %t2619)
  %t2621 = load i64, ptr %local.w0
  %t2622 = call i64 @"sx_f64_mul"(i64 %t2620, i64 %t2621)
  %t2623 = load i64, ptr %local.w1
  %t2624 = call i64 @"sx_f64_mul"(i64 %t2622, i64 %t2623)
  store i64 %t2624, ptr %local.t_w6.2137
  %t2625 = load i64, ptr %local.beta
  %t2626 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.180)
  %t2627 = call i64 @"sx_f64_mul"(i64 %t2625, i64 %t2626)
  %t2628 = load i64, ptr %local.w2
  %t2629 = call i64 @"sx_f64_mul"(i64 %t2627, i64 %t2628)
  %t2630 = load i64, ptr %local.w3
  %t2631 = call i64 @"sx_f64_mul"(i64 %t2629, i64 %t2630)
  store i64 %t2631, ptr %local.t2_w6.2138
  %t2632 = load i64, ptr %local.beta
  %t2633 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.181)
  %t2634 = call i64 @"sx_f64_mul"(i64 %t2632, i64 %t2633)
  %t2635 = load i64, ptr %local.w0
  %t2636 = call i64 @"sx_f64_mul"(i64 %t2634, i64 %t2635)
  %t2637 = load i64, ptr %local.w1
  %t2638 = call i64 @"sx_f64_mul"(i64 %t2636, i64 %t2637)
  store i64 %t2638, ptr %local.t_w8.2139
  %t2639 = load i64, ptr %local.beta
  %t2640 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.182)
  %t2641 = call i64 @"sx_f64_mul"(i64 %t2639, i64 %t2640)
  %t2642 = load i64, ptr %local.w2
  %t2643 = call i64 @"sx_f64_mul"(i64 %t2641, i64 %t2642)
  %t2644 = load i64, ptr %local.w3
  %t2645 = call i64 @"sx_f64_mul"(i64 %t2643, i64 %t2644)
  store i64 %t2645, ptr %local.t2_w8.2140
  %t2646 = load i64, ptr %local.beta
  %t2647 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.183)
  %t2648 = call i64 @"sx_f64_mul"(i64 %t2646, i64 %t2647)
  %t2649 = load i64, ptr %local.w4
  %t2650 = call i64 @"sx_f64_mul"(i64 %t2648, i64 %t2649)
  %t2651 = load i64, ptr %local.w5
  %t2652 = call i64 @"sx_f64_mul"(i64 %t2650, i64 %t2651)
  store i64 %t2652, ptr %local.t3_w8.2141
  %t2653 = load i64, ptr %local.which
  %t2654 = icmp eq i64 %t2653, 0
  %t2655 = zext i1 %t2654 to i64
  %t2656 = icmp ne i64 %t2655, 0
  br i1 %t2656, label %then50, label %else50
then50:
  %t2657 = load i64, ptr %local.u0
  %t2658 = load i64, ptr %local.dt
  %t2659 = load i64, ptr %local.du0.2078
  %t2660 = load i64, ptr %local.su0.2098
  %t2661 = call i64 @"sx_f64_add"(i64 %t2659, i64 %t2660)
  %t2662 = call i64 @"sx_f64_mul"(i64 %t2658, i64 %t2661)
  %t2663 = call i64 @"sx_f64_add"(i64 %t2657, i64 %t2662)
  ret i64 %t2663
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t2664 = phi i64 [ 0, %else50_end ]
  %t2665 = load i64, ptr %local.which
  %t2666 = icmp eq i64 %t2665, 1
  %t2667 = zext i1 %t2666 to i64
  %t2668 = icmp ne i64 %t2667, 0
  br i1 %t2668, label %then51, label %else51
then51:
  %t2669 = load i64, ptr %local.u1
  %t2670 = load i64, ptr %local.dt
  %t2671 = load i64, ptr %local.du1.2079
  %t2672 = load i64, ptr %local.su1.2099
  %t2673 = call i64 @"sx_f64_add"(i64 %t2671, i64 %t2672)
  %t2674 = call i64 @"sx_f64_mul"(i64 %t2670, i64 %t2673)
  %t2675 = call i64 @"sx_f64_add"(i64 %t2669, i64 %t2674)
  ret i64 %t2675
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t2676 = phi i64 [ 0, %else51_end ]
  %t2677 = load i64, ptr %local.which
  %t2678 = icmp eq i64 %t2677, 2
  %t2679 = zext i1 %t2678 to i64
  %t2680 = icmp ne i64 %t2679, 0
  br i1 %t2680, label %then52, label %else52
then52:
  %t2681 = load i64, ptr %local.u2
  %t2682 = load i64, ptr %local.dt
  %t2683 = load i64, ptr %local.du2.2080
  %t2684 = load i64, ptr %local.su2.2100
  %t2685 = call i64 @"sx_f64_add"(i64 %t2683, i64 %t2684)
  %t2686 = call i64 @"sx_f64_mul"(i64 %t2682, i64 %t2685)
  %t2687 = call i64 @"sx_f64_add"(i64 %t2681, i64 %t2686)
  ret i64 %t2687
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t2688 = phi i64 [ 0, %else52_end ]
  %t2689 = load i64, ptr %local.which
  %t2690 = icmp eq i64 %t2689, 3
  %t2691 = zext i1 %t2690 to i64
  %t2692 = icmp ne i64 %t2691, 0
  br i1 %t2692, label %then53, label %else53
then53:
  %t2693 = load i64, ptr %local.u3
  %t2694 = load i64, ptr %local.dt
  %t2695 = load i64, ptr %local.du3.2081
  %t2696 = load i64, ptr %local.su3.2101
  %t2697 = call i64 @"sx_f64_add"(i64 %t2695, i64 %t2696)
  %t2698 = call i64 @"sx_f64_mul"(i64 %t2694, i64 %t2697)
  %t2699 = call i64 @"sx_f64_add"(i64 %t2693, i64 %t2698)
  ret i64 %t2699
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t2700 = phi i64 [ 0, %else53_end ]
  %t2701 = load i64, ptr %local.which
  %t2702 = icmp eq i64 %t2701, 4
  %t2703 = zext i1 %t2702 to i64
  %t2704 = icmp ne i64 %t2703, 0
  br i1 %t2704, label %then54, label %else54
then54:
  %t2705 = load i64, ptr %local.u4
  %t2706 = load i64, ptr %local.dt
  %t2707 = load i64, ptr %local.du4.2082
  %t2708 = load i64, ptr %local.su4.2102
  %t2709 = call i64 @"sx_f64_add"(i64 %t2707, i64 %t2708)
  %t2710 = call i64 @"sx_f64_mul"(i64 %t2706, i64 %t2709)
  %t2711 = call i64 @"sx_f64_add"(i64 %t2705, i64 %t2710)
  ret i64 %t2711
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t2712 = phi i64 [ 0, %else54_end ]
  %t2713 = load i64, ptr %local.which
  %t2714 = icmp eq i64 %t2713, 5
  %t2715 = zext i1 %t2714 to i64
  %t2716 = icmp ne i64 %t2715, 0
  br i1 %t2716, label %then55, label %else55
then55:
  %t2717 = load i64, ptr %local.u5
  %t2718 = load i64, ptr %local.dt
  %t2719 = load i64, ptr %local.du5.2083
  %t2720 = load i64, ptr %local.su5.2103
  %t2721 = call i64 @"sx_f64_add"(i64 %t2719, i64 %t2720)
  %t2722 = call i64 @"sx_f64_mul"(i64 %t2718, i64 %t2721)
  %t2723 = call i64 @"sx_f64_add"(i64 %t2717, i64 %t2722)
  ret i64 %t2723
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t2724 = phi i64 [ 0, %else55_end ]
  %t2725 = load i64, ptr %local.which
  %t2726 = icmp eq i64 %t2725, 6
  %t2727 = zext i1 %t2726 to i64
  %t2728 = icmp ne i64 %t2727, 0
  br i1 %t2728, label %then56, label %else56
then56:
  %t2729 = load i64, ptr %local.u6
  %t2730 = load i64, ptr %local.dt
  %t2731 = load i64, ptr %local.du6.2084
  %t2732 = load i64, ptr %local.su6.2104
  %t2733 = call i64 @"sx_f64_add"(i64 %t2731, i64 %t2732)
  %t2734 = call i64 @"sx_f64_mul"(i64 %t2730, i64 %t2733)
  %t2735 = call i64 @"sx_f64_add"(i64 %t2729, i64 %t2734)
  ret i64 %t2735
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t2736 = phi i64 [ 0, %else56_end ]
  %t2737 = load i64, ptr %local.which
  %t2738 = icmp eq i64 %t2737, 7
  %t2739 = zext i1 %t2738 to i64
  %t2740 = icmp ne i64 %t2739, 0
  br i1 %t2740, label %then57, label %else57
then57:
  %t2741 = load i64, ptr %local.u7
  %t2742 = load i64, ptr %local.dt
  %t2743 = load i64, ptr %local.du7.2085
  %t2744 = load i64, ptr %local.su7.2105
  %t2745 = call i64 @"sx_f64_add"(i64 %t2743, i64 %t2744)
  %t2746 = call i64 @"sx_f64_mul"(i64 %t2742, i64 %t2745)
  %t2747 = call i64 @"sx_f64_add"(i64 %t2741, i64 %t2746)
  ret i64 %t2747
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t2748 = phi i64 [ 0, %else57_end ]
  %t2749 = load i64, ptr %local.which
  %t2750 = icmp eq i64 %t2749, 8
  %t2751 = zext i1 %t2750 to i64
  %t2752 = icmp ne i64 %t2751, 0
  br i1 %t2752, label %then58, label %else58
then58:
  %t2753 = load i64, ptr %local.u8
  %t2754 = load i64, ptr %local.dt
  %t2755 = load i64, ptr %local.du8.2086
  %t2756 = load i64, ptr %local.su8.2106
  %t2757 = call i64 @"sx_f64_add"(i64 %t2755, i64 %t2756)
  %t2758 = call i64 @"sx_f64_mul"(i64 %t2754, i64 %t2757)
  %t2759 = call i64 @"sx_f64_add"(i64 %t2753, i64 %t2758)
  ret i64 %t2759
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t2760 = phi i64 [ 0, %else58_end ]
  %t2761 = load i64, ptr %local.which
  %t2762 = icmp eq i64 %t2761, 9
  %t2763 = zext i1 %t2762 to i64
  %t2764 = icmp ne i64 %t2763, 0
  br i1 %t2764, label %then59, label %else59
then59:
  %t2765 = load i64, ptr %local.u9
  %t2766 = load i64, ptr %local.dt
  %t2767 = load i64, ptr %local.du9.2087
  %t2768 = load i64, ptr %local.su9.2107
  %t2769 = call i64 @"sx_f64_add"(i64 %t2767, i64 %t2768)
  %t2770 = call i64 @"sx_f64_mul"(i64 %t2766, i64 %t2769)
  %t2771 = call i64 @"sx_f64_add"(i64 %t2765, i64 %t2770)
  ret i64 %t2771
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t2772 = phi i64 [ 0, %else59_end ]
  %t2773 = load i64, ptr %local.which
  %t2774 = icmp eq i64 %t2773, 10
  %t2775 = zext i1 %t2774 to i64
  %t2776 = icmp ne i64 %t2775, 0
  br i1 %t2776, label %then60, label %else60
then60:
  %t2777 = load i64, ptr %local.w0
  %t2778 = load i64, ptr %local.dt
  %t2779 = load i64, ptr %local.dw0.2088
  %t2780 = load i64, ptr %local.vw0.2108
  %t2781 = call i64 @"sx_f64_add"(i64 %t2779, i64 %t2780)
  %t2782 = load i64, ptr %local.qw0.2118
  %t2783 = call i64 @"sx_f64_add"(i64 %t2781, i64 %t2782)
  %t2784 = call i64 @"sx_f64_mul"(i64 %t2778, i64 %t2783)
  %t2785 = call i64 @"sx_f64_add"(i64 %t2777, i64 %t2784)
  ret i64 %t2785
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t2786 = phi i64 [ 0, %else60_end ]
  %t2787 = load i64, ptr %local.which
  %t2788 = icmp eq i64 %t2787, 11
  %t2789 = zext i1 %t2788 to i64
  %t2790 = icmp ne i64 %t2789, 0
  br i1 %t2790, label %then61, label %else61
then61:
  %t2791 = load i64, ptr %local.w1
  %t2792 = load i64, ptr %local.dt
  %t2793 = load i64, ptr %local.dw1.2089
  %t2794 = load i64, ptr %local.vw1.2109
  %t2795 = call i64 @"sx_f64_add"(i64 %t2793, i64 %t2794)
  %t2796 = load i64, ptr %local.qw1.2119
  %t2797 = call i64 @"sx_f64_add"(i64 %t2795, i64 %t2796)
  %t2798 = call i64 @"sx_f64_mul"(i64 %t2792, i64 %t2797)
  %t2799 = call i64 @"sx_f64_add"(i64 %t2791, i64 %t2798)
  ret i64 %t2799
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t2800 = phi i64 [ 0, %else61_end ]
  %t2801 = load i64, ptr %local.which
  %t2802 = icmp eq i64 %t2801, 12
  %t2803 = zext i1 %t2802 to i64
  %t2804 = icmp ne i64 %t2803, 0
  br i1 %t2804, label %then62, label %else62
then62:
  %t2805 = load i64, ptr %local.w2
  %t2806 = load i64, ptr %local.dt
  %t2807 = load i64, ptr %local.dw2.2090
  %t2808 = load i64, ptr %local.vw2.2110
  %t2809 = call i64 @"sx_f64_add"(i64 %t2807, i64 %t2808)
  %t2810 = load i64, ptr %local.qw2.2120
  %t2811 = call i64 @"sx_f64_add"(i64 %t2809, i64 %t2810)
  %t2812 = load i64, ptr %local.c_w2.2128
  %t2813 = call i64 @"sx_f64_add"(i64 %t2811, i64 %t2812)
  %t2814 = call i64 @"sx_f64_mul"(i64 %t2806, i64 %t2813)
  %t2815 = call i64 @"sx_f64_add"(i64 %t2805, i64 %t2814)
  ret i64 %t2815
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t2816 = phi i64 [ 0, %else62_end ]
  %t2817 = load i64, ptr %local.which
  %t2818 = icmp eq i64 %t2817, 13
  %t2819 = zext i1 %t2818 to i64
  %t2820 = icmp ne i64 %t2819, 0
  br i1 %t2820, label %then63, label %else63
then63:
  %t2821 = load i64, ptr %local.w3
  %t2822 = load i64, ptr %local.dt
  %t2823 = load i64, ptr %local.dw3.2091
  %t2824 = load i64, ptr %local.vw3.2111
  %t2825 = call i64 @"sx_f64_add"(i64 %t2823, i64 %t2824)
  %t2826 = load i64, ptr %local.qw3.2121
  %t2827 = call i64 @"sx_f64_add"(i64 %t2825, i64 %t2826)
  %t2828 = load i64, ptr %local.c_w3.2129
  %t2829 = call i64 @"sx_f64_add"(i64 %t2827, i64 %t2828)
  %t2830 = call i64 @"sx_f64_mul"(i64 %t2822, i64 %t2829)
  %t2831 = call i64 @"sx_f64_add"(i64 %t2821, i64 %t2830)
  ret i64 %t2831
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t2832 = phi i64 [ 0, %else63_end ]
  %t2833 = load i64, ptr %local.which
  %t2834 = icmp eq i64 %t2833, 14
  %t2835 = zext i1 %t2834 to i64
  %t2836 = icmp ne i64 %t2835, 0
  br i1 %t2836, label %then64, label %else64
then64:
  %t2837 = load i64, ptr %local.w4
  %t2838 = load i64, ptr %local.dt
  %t2839 = load i64, ptr %local.dw4.2092
  %t2840 = load i64, ptr %local.vw4.2112
  %t2841 = call i64 @"sx_f64_add"(i64 %t2839, i64 %t2840)
  %t2842 = load i64, ptr %local.qw4.2122
  %t2843 = call i64 @"sx_f64_add"(i64 %t2841, i64 %t2842)
  %t2844 = load i64, ptr %local.c_w4.2130
  %t2845 = call i64 @"sx_f64_add"(i64 %t2843, i64 %t2844)
  %t2846 = load i64, ptr %local.t_w4.2136
  %t2847 = call i64 @"sx_f64_add"(i64 %t2845, i64 %t2846)
  %t2848 = call i64 @"sx_f64_mul"(i64 %t2838, i64 %t2847)
  %t2849 = call i64 @"sx_f64_add"(i64 %t2837, i64 %t2848)
  ret i64 %t2849
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t2850 = phi i64 [ 0, %else64_end ]
  %t2851 = load i64, ptr %local.which
  %t2852 = icmp eq i64 %t2851, 15
  %t2853 = zext i1 %t2852 to i64
  %t2854 = icmp ne i64 %t2853, 0
  br i1 %t2854, label %then65, label %else65
then65:
  %t2855 = load i64, ptr %local.w5
  %t2856 = load i64, ptr %local.dt
  %t2857 = load i64, ptr %local.dw5.2093
  %t2858 = load i64, ptr %local.vw5.2113
  %t2859 = call i64 @"sx_f64_add"(i64 %t2857, i64 %t2858)
  %t2860 = load i64, ptr %local.qw5.2123
  %t2861 = call i64 @"sx_f64_add"(i64 %t2859, i64 %t2860)
  %t2862 = load i64, ptr %local.c_w5.2131
  %t2863 = call i64 @"sx_f64_add"(i64 %t2861, i64 %t2862)
  %t2864 = call i64 @"sx_f64_mul"(i64 %t2856, i64 %t2863)
  %t2865 = call i64 @"sx_f64_add"(i64 %t2855, i64 %t2864)
  ret i64 %t2865
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t2866 = phi i64 [ 0, %else65_end ]
  %t2867 = load i64, ptr %local.which
  %t2868 = icmp eq i64 %t2867, 16
  %t2869 = zext i1 %t2868 to i64
  %t2870 = icmp ne i64 %t2869, 0
  br i1 %t2870, label %then66, label %else66
then66:
  %t2871 = load i64, ptr %local.w6
  %t2872 = load i64, ptr %local.dt
  %t2873 = load i64, ptr %local.dw6.2094
  %t2874 = load i64, ptr %local.vw6.2114
  %t2875 = call i64 @"sx_f64_add"(i64 %t2873, i64 %t2874)
  %t2876 = load i64, ptr %local.qw6.2124
  %t2877 = call i64 @"sx_f64_add"(i64 %t2875, i64 %t2876)
  %t2878 = load i64, ptr %local.c_w6.2132
  %t2879 = call i64 @"sx_f64_add"(i64 %t2877, i64 %t2878)
  %t2880 = load i64, ptr %local.t_w6.2137
  %t2881 = call i64 @"sx_f64_add"(i64 %t2879, i64 %t2880)
  %t2882 = load i64, ptr %local.t2_w6.2138
  %t2883 = call i64 @"sx_f64_add"(i64 %t2881, i64 %t2882)
  %t2884 = call i64 @"sx_f64_mul"(i64 %t2872, i64 %t2883)
  %t2885 = call i64 @"sx_f64_add"(i64 %t2871, i64 %t2884)
  ret i64 %t2885
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t2886 = phi i64 [ 0, %else66_end ]
  %t2887 = load i64, ptr %local.which
  %t2888 = icmp eq i64 %t2887, 17
  %t2889 = zext i1 %t2888 to i64
  %t2890 = icmp ne i64 %t2889, 0
  br i1 %t2890, label %then67, label %else67
then67:
  %t2891 = load i64, ptr %local.w7
  %t2892 = load i64, ptr %local.dt
  %t2893 = load i64, ptr %local.dw7.2095
  %t2894 = load i64, ptr %local.vw7.2115
  %t2895 = call i64 @"sx_f64_add"(i64 %t2893, i64 %t2894)
  %t2896 = load i64, ptr %local.qw7.2125
  %t2897 = call i64 @"sx_f64_add"(i64 %t2895, i64 %t2896)
  %t2898 = load i64, ptr %local.c_w7.2133
  %t2899 = call i64 @"sx_f64_add"(i64 %t2897, i64 %t2898)
  %t2900 = call i64 @"sx_f64_mul"(i64 %t2892, i64 %t2899)
  %t2901 = call i64 @"sx_f64_add"(i64 %t2891, i64 %t2900)
  ret i64 %t2901
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t2902 = phi i64 [ 0, %else67_end ]
  %t2903 = load i64, ptr %local.which
  %t2904 = icmp eq i64 %t2903, 18
  %t2905 = zext i1 %t2904 to i64
  %t2906 = icmp ne i64 %t2905, 0
  br i1 %t2906, label %then68, label %else68
then68:
  %t2907 = load i64, ptr %local.w8
  %t2908 = load i64, ptr %local.dt
  %t2909 = load i64, ptr %local.dw8.2096
  %t2910 = load i64, ptr %local.vw8.2116
  %t2911 = call i64 @"sx_f64_add"(i64 %t2909, i64 %t2910)
  %t2912 = load i64, ptr %local.qw8.2126
  %t2913 = call i64 @"sx_f64_add"(i64 %t2911, i64 %t2912)
  %t2914 = load i64, ptr %local.c_w8.2134
  %t2915 = call i64 @"sx_f64_add"(i64 %t2913, i64 %t2914)
  %t2916 = load i64, ptr %local.t_w8.2139
  %t2917 = call i64 @"sx_f64_add"(i64 %t2915, i64 %t2916)
  %t2918 = load i64, ptr %local.t2_w8.2140
  %t2919 = call i64 @"sx_f64_add"(i64 %t2917, i64 %t2918)
  %t2920 = load i64, ptr %local.t3_w8.2141
  %t2921 = call i64 @"sx_f64_add"(i64 %t2919, i64 %t2920)
  %t2922 = call i64 @"sx_f64_mul"(i64 %t2908, i64 %t2921)
  %t2923 = call i64 @"sx_f64_add"(i64 %t2907, i64 %t2922)
  ret i64 %t2923
else68:
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t2924 = phi i64 [ 0, %else68_end ]
  %t2925 = load i64, ptr %local.w9
  %t2926 = load i64, ptr %local.dt
  %t2927 = load i64, ptr %local.dw9.2097
  %t2928 = load i64, ptr %local.vw9.2117
  %t2929 = call i64 @"sx_f64_add"(i64 %t2927, i64 %t2928)
  %t2930 = load i64, ptr %local.qw9.2127
  %t2931 = call i64 @"sx_f64_add"(i64 %t2929, i64 %t2930)
  %t2932 = load i64, ptr %local.c_w9.2135
  %t2933 = call i64 @"sx_f64_add"(i64 %t2931, i64 %t2932)
  %t2934 = call i64 @"sx_f64_mul"(i64 %t2926, i64 %t2933)
  %t2935 = call i64 @"sx_f64_add"(i64 %t2925, i64 %t2934)
  ret i64 %t2935
}

define i64 @"step24"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %u5, i64 %u6, i64 %u7, i64 %u8, i64 %u9, i64 %u10, i64 %u11, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %w6, i64 %w7, i64 %w8, i64 %w9, i64 %w10, i64 %w11, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %beta, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.2936 = alloca i64
  %local.du0.2937 = alloca i64
  %local.du1.2938 = alloca i64
  %local.du2.2939 = alloca i64
  %local.du3.2940 = alloca i64
  %local.du4.2941 = alloca i64
  %local.du5.2942 = alloca i64
  %local.du6.2943 = alloca i64
  %local.du7.2944 = alloca i64
  %local.du8.2945 = alloca i64
  %local.du9.2946 = alloca i64
  %local.du10.2947 = alloca i64
  %local.du11.2948 = alloca i64
  %local.dw0.2949 = alloca i64
  %local.dw1.2950 = alloca i64
  %local.dw2.2951 = alloca i64
  %local.dw3.2952 = alloca i64
  %local.dw4.2953 = alloca i64
  %local.dw5.2954 = alloca i64
  %local.dw6.2955 = alloca i64
  %local.dw7.2956 = alloca i64
  %local.dw8.2957 = alloca i64
  %local.dw9.2958 = alloca i64
  %local.dw10.2959 = alloca i64
  %local.dw11.2960 = alloca i64
  %local.su0.2961 = alloca i64
  %local.su1.2962 = alloca i64
  %local.su2.2963 = alloca i64
  %local.su3.2964 = alloca i64
  %local.su4.2965 = alloca i64
  %local.su5.2966 = alloca i64
  %local.su6.2967 = alloca i64
  %local.su7.2968 = alloca i64
  %local.su8.2969 = alloca i64
  %local.su9.2970 = alloca i64
  %local.su10.2971 = alloca i64
  %local.su11.2972 = alloca i64
  %local.vw0.2973 = alloca i64
  %local.vw1.2974 = alloca i64
  %local.vw2.2975 = alloca i64
  %local.vw3.2976 = alloca i64
  %local.vw4.2977 = alloca i64
  %local.vw5.2978 = alloca i64
  %local.vw6.2979 = alloca i64
  %local.vw7.2980 = alloca i64
  %local.vw8.2981 = alloca i64
  %local.vw9.2982 = alloca i64
  %local.vw10.2983 = alloca i64
  %local.vw11.2984 = alloca i64
  %local.qw0.2985 = alloca i64
  %local.qw1.2986 = alloca i64
  %local.qw2.2987 = alloca i64
  %local.qw3.2988 = alloca i64
  %local.qw4.2989 = alloca i64
  %local.qw5.2990 = alloca i64
  %local.qw6.2991 = alloca i64
  %local.qw7.2992 = alloca i64
  %local.qw8.2993 = alloca i64
  %local.qw9.2994 = alloca i64
  %local.qw10.2995 = alloca i64
  %local.qw11.2996 = alloca i64
  %local.c_w2.2997 = alloca i64
  %local.c_w3.2998 = alloca i64
  %local.c_w4.2999 = alloca i64
  %local.c_w5.3000 = alloca i64
  %local.c_w6.3001 = alloca i64
  %local.c_w7.3002 = alloca i64
  %local.c_w8.3003 = alloca i64
  %local.c_w9.3004 = alloca i64
  %local.c_w10.3005 = alloca i64
  %local.c_w11.3006 = alloca i64
  %local.t_w4.3007 = alloca i64
  %local.t_w6.3008 = alloca i64
  %local.t2_w6.3009 = alloca i64
  %local.t_w8.3010 = alloca i64
  %local.t2_w8.3011 = alloca i64
  %local.t3_w8.3012 = alloca i64
  %local.t_w10.3013 = alloca i64
  %local.t2_w10.3014 = alloca i64
  %local.t3_w10.3015 = alloca i64
  %local.t4_w10.3016 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.u5 = alloca i64
  store i64 %u5, ptr %local.u5
  %local.u6 = alloca i64
  store i64 %u6, ptr %local.u6
  %local.u7 = alloca i64
  store i64 %u7, ptr %local.u7
  %local.u8 = alloca i64
  store i64 %u8, ptr %local.u8
  %local.u9 = alloca i64
  store i64 %u9, ptr %local.u9
  %local.u10 = alloca i64
  store i64 %u10, ptr %local.u10
  %local.u11 = alloca i64
  store i64 %u11, ptr %local.u11
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.w6 = alloca i64
  store i64 %w6, ptr %local.w6
  %local.w7 = alloca i64
  store i64 %w7, ptr %local.w7
  %local.w8 = alloca i64
  store i64 %w8, ptr %local.w8
  %local.w9 = alloca i64
  store i64 %w9, ptr %local.w9
  %local.w10 = alloca i64
  store i64 %w10, ptr %local.w10
  %local.w11 = alloca i64
  store i64 %w11, ptr %local.w11
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.beta = alloca i64
  store i64 %beta, ptr %local.beta
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t3017 = load i64, ptr %local.w0
  %t3018 = load i64, ptr %local.w0
  %t3019 = call i64 @"sx_f64_mul"(i64 %t3017, i64 %t3018)
  %t3020 = load i64, ptr %local.w1
  %t3021 = load i64, ptr %local.w1
  %t3022 = call i64 @"sx_f64_mul"(i64 %t3020, i64 %t3021)
  %t3023 = call i64 @"sx_f64_add"(i64 %t3019, i64 %t3022)
  %t3024 = load i64, ptr %local.w2
  %t3025 = load i64, ptr %local.w2
  %t3026 = call i64 @"sx_f64_mul"(i64 %t3024, i64 %t3025)
  %t3027 = call i64 @"sx_f64_add"(i64 %t3023, i64 %t3026)
  %t3028 = load i64, ptr %local.w3
  %t3029 = load i64, ptr %local.w3
  %t3030 = call i64 @"sx_f64_mul"(i64 %t3028, i64 %t3029)
  %t3031 = call i64 @"sx_f64_add"(i64 %t3027, i64 %t3030)
  %t3032 = load i64, ptr %local.w4
  %t3033 = load i64, ptr %local.w4
  %t3034 = call i64 @"sx_f64_mul"(i64 %t3032, i64 %t3033)
  %t3035 = call i64 @"sx_f64_add"(i64 %t3031, i64 %t3034)
  %t3036 = load i64, ptr %local.w5
  %t3037 = load i64, ptr %local.w5
  %t3038 = call i64 @"sx_f64_mul"(i64 %t3036, i64 %t3037)
  %t3039 = call i64 @"sx_f64_add"(i64 %t3035, i64 %t3038)
  %t3040 = load i64, ptr %local.w6
  %t3041 = load i64, ptr %local.w6
  %t3042 = call i64 @"sx_f64_mul"(i64 %t3040, i64 %t3041)
  %t3043 = call i64 @"sx_f64_add"(i64 %t3039, i64 %t3042)
  %t3044 = load i64, ptr %local.w7
  %t3045 = load i64, ptr %local.w7
  %t3046 = call i64 @"sx_f64_mul"(i64 %t3044, i64 %t3045)
  %t3047 = call i64 @"sx_f64_add"(i64 %t3043, i64 %t3046)
  %t3048 = load i64, ptr %local.w8
  %t3049 = load i64, ptr %local.w8
  %t3050 = call i64 @"sx_f64_mul"(i64 %t3048, i64 %t3049)
  %t3051 = call i64 @"sx_f64_add"(i64 %t3047, i64 %t3050)
  %t3052 = load i64, ptr %local.w9
  %t3053 = load i64, ptr %local.w9
  %t3054 = call i64 @"sx_f64_mul"(i64 %t3052, i64 %t3053)
  %t3055 = call i64 @"sx_f64_add"(i64 %t3051, i64 %t3054)
  %t3056 = load i64, ptr %local.w10
  %t3057 = load i64, ptr %local.w10
  %t3058 = call i64 @"sx_f64_mul"(i64 %t3056, i64 %t3057)
  %t3059 = call i64 @"sx_f64_add"(i64 %t3055, i64 %t3058)
  %t3060 = load i64, ptr %local.w11
  %t3061 = load i64, ptr %local.w11
  %t3062 = call i64 @"sx_f64_mul"(i64 %t3060, i64 %t3061)
  %t3063 = call i64 @"sx_f64_add"(i64 %t3059, i64 %t3062)
  store i64 %t3063, ptr %local.omega_sq.2936
  %t3064 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.184)
  %t3065 = load i64, ptr %local.nu
  %t3066 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.185)
  %t3067 = call i64 @"sx_f64_mul"(i64 %t3065, i64 %t3066)
  %t3068 = load i64, ptr %local.u0
  %t3069 = call i64 @"sx_f64_mul"(i64 %t3067, i64 %t3068)
  %t3070 = call i64 @"sx_f64_sub"(i64 %t3064, i64 %t3069)
  store i64 %t3070, ptr %local.du0.2937
  %t3071 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.186)
  %t3072 = load i64, ptr %local.nu
  %t3073 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.187)
  %t3074 = call i64 @"sx_f64_mul"(i64 %t3072, i64 %t3073)
  %t3075 = load i64, ptr %local.u1
  %t3076 = call i64 @"sx_f64_mul"(i64 %t3074, i64 %t3075)
  %t3077 = call i64 @"sx_f64_sub"(i64 %t3071, i64 %t3076)
  store i64 %t3077, ptr %local.du1.2938
  %t3078 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.188)
  %t3079 = load i64, ptr %local.nu
  %t3080 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.189)
  %t3081 = call i64 @"sx_f64_mul"(i64 %t3079, i64 %t3080)
  %t3082 = load i64, ptr %local.u2
  %t3083 = call i64 @"sx_f64_mul"(i64 %t3081, i64 %t3082)
  %t3084 = call i64 @"sx_f64_sub"(i64 %t3078, i64 %t3083)
  store i64 %t3084, ptr %local.du2.2939
  %t3085 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.190)
  %t3086 = load i64, ptr %local.nu
  %t3087 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.191)
  %t3088 = call i64 @"sx_f64_mul"(i64 %t3086, i64 %t3087)
  %t3089 = load i64, ptr %local.u3
  %t3090 = call i64 @"sx_f64_mul"(i64 %t3088, i64 %t3089)
  %t3091 = call i64 @"sx_f64_sub"(i64 %t3085, i64 %t3090)
  store i64 %t3091, ptr %local.du3.2940
  %t3092 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.192)
  %t3093 = load i64, ptr %local.nu
  %t3094 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.193)
  %t3095 = call i64 @"sx_f64_mul"(i64 %t3093, i64 %t3094)
  %t3096 = load i64, ptr %local.u4
  %t3097 = call i64 @"sx_f64_mul"(i64 %t3095, i64 %t3096)
  %t3098 = call i64 @"sx_f64_sub"(i64 %t3092, i64 %t3097)
  store i64 %t3098, ptr %local.du4.2941
  %t3099 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.194)
  %t3100 = load i64, ptr %local.nu
  %t3101 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.195)
  %t3102 = call i64 @"sx_f64_mul"(i64 %t3100, i64 %t3101)
  %t3103 = load i64, ptr %local.u5
  %t3104 = call i64 @"sx_f64_mul"(i64 %t3102, i64 %t3103)
  %t3105 = call i64 @"sx_f64_sub"(i64 %t3099, i64 %t3104)
  store i64 %t3105, ptr %local.du5.2942
  %t3106 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.196)
  %t3107 = load i64, ptr %local.nu
  %t3108 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.197)
  %t3109 = call i64 @"sx_f64_mul"(i64 %t3107, i64 %t3108)
  %t3110 = load i64, ptr %local.u6
  %t3111 = call i64 @"sx_f64_mul"(i64 %t3109, i64 %t3110)
  %t3112 = call i64 @"sx_f64_sub"(i64 %t3106, i64 %t3111)
  store i64 %t3112, ptr %local.du6.2943
  %t3113 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.198)
  %t3114 = load i64, ptr %local.nu
  %t3115 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.199)
  %t3116 = call i64 @"sx_f64_mul"(i64 %t3114, i64 %t3115)
  %t3117 = load i64, ptr %local.u7
  %t3118 = call i64 @"sx_f64_mul"(i64 %t3116, i64 %t3117)
  %t3119 = call i64 @"sx_f64_sub"(i64 %t3113, i64 %t3118)
  store i64 %t3119, ptr %local.du7.2944
  %t3120 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.200)
  %t3121 = load i64, ptr %local.nu
  %t3122 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.201)
  %t3123 = call i64 @"sx_f64_mul"(i64 %t3121, i64 %t3122)
  %t3124 = load i64, ptr %local.u8
  %t3125 = call i64 @"sx_f64_mul"(i64 %t3123, i64 %t3124)
  %t3126 = call i64 @"sx_f64_sub"(i64 %t3120, i64 %t3125)
  store i64 %t3126, ptr %local.du8.2945
  %t3127 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.202)
  %t3128 = load i64, ptr %local.nu
  %t3129 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.203)
  %t3130 = call i64 @"sx_f64_mul"(i64 %t3128, i64 %t3129)
  %t3131 = load i64, ptr %local.u9
  %t3132 = call i64 @"sx_f64_mul"(i64 %t3130, i64 %t3131)
  %t3133 = call i64 @"sx_f64_sub"(i64 %t3127, i64 %t3132)
  store i64 %t3133, ptr %local.du9.2946
  %t3134 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.204)
  %t3135 = load i64, ptr %local.nu
  %t3136 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.205)
  %t3137 = call i64 @"sx_f64_mul"(i64 %t3135, i64 %t3136)
  %t3138 = load i64, ptr %local.u10
  %t3139 = call i64 @"sx_f64_mul"(i64 %t3137, i64 %t3138)
  %t3140 = call i64 @"sx_f64_sub"(i64 %t3134, i64 %t3139)
  store i64 %t3140, ptr %local.du10.2947
  %t3141 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.206)
  %t3142 = load i64, ptr %local.nu
  %t3143 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.207)
  %t3144 = call i64 @"sx_f64_mul"(i64 %t3142, i64 %t3143)
  %t3145 = load i64, ptr %local.u11
  %t3146 = call i64 @"sx_f64_mul"(i64 %t3144, i64 %t3145)
  %t3147 = call i64 @"sx_f64_sub"(i64 %t3141, i64 %t3146)
  store i64 %t3147, ptr %local.du11.2948
  %t3148 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.208)
  %t3149 = load i64, ptr %local.nu
  %t3150 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.209)
  %t3151 = call i64 @"sx_f64_mul"(i64 %t3149, i64 %t3150)
  %t3152 = load i64, ptr %local.w0
  %t3153 = call i64 @"sx_f64_mul"(i64 %t3151, i64 %t3152)
  %t3154 = call i64 @"sx_f64_sub"(i64 %t3148, i64 %t3153)
  store i64 %t3154, ptr %local.dw0.2949
  %t3155 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.210)
  %t3156 = load i64, ptr %local.nu
  %t3157 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.211)
  %t3158 = call i64 @"sx_f64_mul"(i64 %t3156, i64 %t3157)
  %t3159 = load i64, ptr %local.w1
  %t3160 = call i64 @"sx_f64_mul"(i64 %t3158, i64 %t3159)
  %t3161 = call i64 @"sx_f64_sub"(i64 %t3155, i64 %t3160)
  store i64 %t3161, ptr %local.dw1.2950
  %t3162 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.212)
  %t3163 = load i64, ptr %local.nu
  %t3164 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.213)
  %t3165 = call i64 @"sx_f64_mul"(i64 %t3163, i64 %t3164)
  %t3166 = load i64, ptr %local.w2
  %t3167 = call i64 @"sx_f64_mul"(i64 %t3165, i64 %t3166)
  %t3168 = call i64 @"sx_f64_sub"(i64 %t3162, i64 %t3167)
  store i64 %t3168, ptr %local.dw2.2951
  %t3169 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.214)
  %t3170 = load i64, ptr %local.nu
  %t3171 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.215)
  %t3172 = call i64 @"sx_f64_mul"(i64 %t3170, i64 %t3171)
  %t3173 = load i64, ptr %local.w3
  %t3174 = call i64 @"sx_f64_mul"(i64 %t3172, i64 %t3173)
  %t3175 = call i64 @"sx_f64_sub"(i64 %t3169, i64 %t3174)
  store i64 %t3175, ptr %local.dw3.2952
  %t3176 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.216)
  %t3177 = load i64, ptr %local.nu
  %t3178 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.217)
  %t3179 = call i64 @"sx_f64_mul"(i64 %t3177, i64 %t3178)
  %t3180 = load i64, ptr %local.w4
  %t3181 = call i64 @"sx_f64_mul"(i64 %t3179, i64 %t3180)
  %t3182 = call i64 @"sx_f64_sub"(i64 %t3176, i64 %t3181)
  store i64 %t3182, ptr %local.dw4.2953
  %t3183 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.218)
  %t3184 = load i64, ptr %local.nu
  %t3185 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.219)
  %t3186 = call i64 @"sx_f64_mul"(i64 %t3184, i64 %t3185)
  %t3187 = load i64, ptr %local.w5
  %t3188 = call i64 @"sx_f64_mul"(i64 %t3186, i64 %t3187)
  %t3189 = call i64 @"sx_f64_sub"(i64 %t3183, i64 %t3188)
  store i64 %t3189, ptr %local.dw5.2954
  %t3190 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.220)
  %t3191 = load i64, ptr %local.nu
  %t3192 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.221)
  %t3193 = call i64 @"sx_f64_mul"(i64 %t3191, i64 %t3192)
  %t3194 = load i64, ptr %local.w6
  %t3195 = call i64 @"sx_f64_mul"(i64 %t3193, i64 %t3194)
  %t3196 = call i64 @"sx_f64_sub"(i64 %t3190, i64 %t3195)
  store i64 %t3196, ptr %local.dw6.2955
  %t3197 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.222)
  %t3198 = load i64, ptr %local.nu
  %t3199 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.223)
  %t3200 = call i64 @"sx_f64_mul"(i64 %t3198, i64 %t3199)
  %t3201 = load i64, ptr %local.w7
  %t3202 = call i64 @"sx_f64_mul"(i64 %t3200, i64 %t3201)
  %t3203 = call i64 @"sx_f64_sub"(i64 %t3197, i64 %t3202)
  store i64 %t3203, ptr %local.dw7.2956
  %t3204 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.224)
  %t3205 = load i64, ptr %local.nu
  %t3206 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.225)
  %t3207 = call i64 @"sx_f64_mul"(i64 %t3205, i64 %t3206)
  %t3208 = load i64, ptr %local.w8
  %t3209 = call i64 @"sx_f64_mul"(i64 %t3207, i64 %t3208)
  %t3210 = call i64 @"sx_f64_sub"(i64 %t3204, i64 %t3209)
  store i64 %t3210, ptr %local.dw8.2957
  %t3211 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.226)
  %t3212 = load i64, ptr %local.nu
  %t3213 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.227)
  %t3214 = call i64 @"sx_f64_mul"(i64 %t3212, i64 %t3213)
  %t3215 = load i64, ptr %local.w9
  %t3216 = call i64 @"sx_f64_mul"(i64 %t3214, i64 %t3215)
  %t3217 = call i64 @"sx_f64_sub"(i64 %t3211, i64 %t3216)
  store i64 %t3217, ptr %local.dw9.2958
  %t3218 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.228)
  %t3219 = load i64, ptr %local.nu
  %t3220 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.229)
  %t3221 = call i64 @"sx_f64_mul"(i64 %t3219, i64 %t3220)
  %t3222 = load i64, ptr %local.w10
  %t3223 = call i64 @"sx_f64_mul"(i64 %t3221, i64 %t3222)
  %t3224 = call i64 @"sx_f64_sub"(i64 %t3218, i64 %t3223)
  store i64 %t3224, ptr %local.dw10.2959
  %t3225 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.230)
  %t3226 = load i64, ptr %local.nu
  %t3227 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.231)
  %t3228 = call i64 @"sx_f64_mul"(i64 %t3226, i64 %t3227)
  %t3229 = load i64, ptr %local.w11
  %t3230 = call i64 @"sx_f64_mul"(i64 %t3228, i64 %t3229)
  %t3231 = call i64 @"sx_f64_sub"(i64 %t3225, i64 %t3230)
  store i64 %t3231, ptr %local.dw11.2960
  %t3232 = load i64, ptr %local.sigma
  %t3233 = load i64, ptr %local.w0
  %t3234 = load i64, ptr %local.u1
  %t3235 = call i64 @"sx_f64_mul"(i64 %t3233, i64 %t3234)
  %t3236 = load i64, ptr %local.w1
  %t3237 = load i64, ptr %local.u0
  %t3238 = call i64 @"sx_f64_mul"(i64 %t3236, i64 %t3237)
  %t3239 = call i64 @"sx_f64_sub"(i64 %t3235, i64 %t3238)
  %t3240 = call i64 @"sx_f64_mul"(i64 %t3232, i64 %t3239)
  store i64 %t3240, ptr %local.su0.2961
  %t3241 = load i64, ptr %local.sigma
  %t3242 = load i64, ptr %local.w1
  %t3243 = load i64, ptr %local.u0
  %t3244 = call i64 @"sx_f64_mul"(i64 %t3242, i64 %t3243)
  %t3245 = load i64, ptr %local.w0
  %t3246 = load i64, ptr %local.u1
  %t3247 = call i64 @"sx_f64_mul"(i64 %t3245, i64 %t3246)
  %t3248 = call i64 @"sx_f64_sub"(i64 %t3244, i64 %t3247)
  %t3249 = call i64 @"sx_f64_mul"(i64 %t3241, i64 %t3248)
  store i64 %t3249, ptr %local.su1.2962
  %t3250 = load i64, ptr %local.sigma
  %t3251 = load i64, ptr %local.w2
  %t3252 = load i64, ptr %local.u3
  %t3253 = call i64 @"sx_f64_mul"(i64 %t3251, i64 %t3252)
  %t3254 = load i64, ptr %local.w3
  %t3255 = load i64, ptr %local.u2
  %t3256 = call i64 @"sx_f64_mul"(i64 %t3254, i64 %t3255)
  %t3257 = call i64 @"sx_f64_sub"(i64 %t3253, i64 %t3256)
  %t3258 = call i64 @"sx_f64_mul"(i64 %t3250, i64 %t3257)
  store i64 %t3258, ptr %local.su2.2963
  %t3259 = load i64, ptr %local.sigma
  %t3260 = load i64, ptr %local.w3
  %t3261 = load i64, ptr %local.u2
  %t3262 = call i64 @"sx_f64_mul"(i64 %t3260, i64 %t3261)
  %t3263 = load i64, ptr %local.w2
  %t3264 = load i64, ptr %local.u3
  %t3265 = call i64 @"sx_f64_mul"(i64 %t3263, i64 %t3264)
  %t3266 = call i64 @"sx_f64_sub"(i64 %t3262, i64 %t3265)
  %t3267 = call i64 @"sx_f64_mul"(i64 %t3259, i64 %t3266)
  store i64 %t3267, ptr %local.su3.2964
  %t3268 = load i64, ptr %local.sigma
  %t3269 = load i64, ptr %local.w4
  %t3270 = load i64, ptr %local.u5
  %t3271 = call i64 @"sx_f64_mul"(i64 %t3269, i64 %t3270)
  %t3272 = load i64, ptr %local.w5
  %t3273 = load i64, ptr %local.u4
  %t3274 = call i64 @"sx_f64_mul"(i64 %t3272, i64 %t3273)
  %t3275 = call i64 @"sx_f64_sub"(i64 %t3271, i64 %t3274)
  %t3276 = call i64 @"sx_f64_mul"(i64 %t3268, i64 %t3275)
  store i64 %t3276, ptr %local.su4.2965
  %t3277 = load i64, ptr %local.sigma
  %t3278 = load i64, ptr %local.w5
  %t3279 = load i64, ptr %local.u4
  %t3280 = call i64 @"sx_f64_mul"(i64 %t3278, i64 %t3279)
  %t3281 = load i64, ptr %local.w4
  %t3282 = load i64, ptr %local.u5
  %t3283 = call i64 @"sx_f64_mul"(i64 %t3281, i64 %t3282)
  %t3284 = call i64 @"sx_f64_sub"(i64 %t3280, i64 %t3283)
  %t3285 = call i64 @"sx_f64_mul"(i64 %t3277, i64 %t3284)
  store i64 %t3285, ptr %local.su5.2966
  %t3286 = load i64, ptr %local.sigma
  %t3287 = load i64, ptr %local.w6
  %t3288 = load i64, ptr %local.u7
  %t3289 = call i64 @"sx_f64_mul"(i64 %t3287, i64 %t3288)
  %t3290 = load i64, ptr %local.w7
  %t3291 = load i64, ptr %local.u6
  %t3292 = call i64 @"sx_f64_mul"(i64 %t3290, i64 %t3291)
  %t3293 = call i64 @"sx_f64_sub"(i64 %t3289, i64 %t3292)
  %t3294 = call i64 @"sx_f64_mul"(i64 %t3286, i64 %t3293)
  store i64 %t3294, ptr %local.su6.2967
  %t3295 = load i64, ptr %local.sigma
  %t3296 = load i64, ptr %local.w7
  %t3297 = load i64, ptr %local.u6
  %t3298 = call i64 @"sx_f64_mul"(i64 %t3296, i64 %t3297)
  %t3299 = load i64, ptr %local.w6
  %t3300 = load i64, ptr %local.u7
  %t3301 = call i64 @"sx_f64_mul"(i64 %t3299, i64 %t3300)
  %t3302 = call i64 @"sx_f64_sub"(i64 %t3298, i64 %t3301)
  %t3303 = call i64 @"sx_f64_mul"(i64 %t3295, i64 %t3302)
  store i64 %t3303, ptr %local.su7.2968
  %t3304 = load i64, ptr %local.sigma
  %t3305 = load i64, ptr %local.w8
  %t3306 = load i64, ptr %local.u9
  %t3307 = call i64 @"sx_f64_mul"(i64 %t3305, i64 %t3306)
  %t3308 = load i64, ptr %local.w9
  %t3309 = load i64, ptr %local.u8
  %t3310 = call i64 @"sx_f64_mul"(i64 %t3308, i64 %t3309)
  %t3311 = call i64 @"sx_f64_sub"(i64 %t3307, i64 %t3310)
  %t3312 = call i64 @"sx_f64_mul"(i64 %t3304, i64 %t3311)
  store i64 %t3312, ptr %local.su8.2969
  %t3313 = load i64, ptr %local.sigma
  %t3314 = load i64, ptr %local.w9
  %t3315 = load i64, ptr %local.u8
  %t3316 = call i64 @"sx_f64_mul"(i64 %t3314, i64 %t3315)
  %t3317 = load i64, ptr %local.w8
  %t3318 = load i64, ptr %local.u9
  %t3319 = call i64 @"sx_f64_mul"(i64 %t3317, i64 %t3318)
  %t3320 = call i64 @"sx_f64_sub"(i64 %t3316, i64 %t3319)
  %t3321 = call i64 @"sx_f64_mul"(i64 %t3313, i64 %t3320)
  store i64 %t3321, ptr %local.su9.2970
  %t3322 = load i64, ptr %local.sigma
  %t3323 = load i64, ptr %local.w10
  %t3324 = load i64, ptr %local.u11
  %t3325 = call i64 @"sx_f64_mul"(i64 %t3323, i64 %t3324)
  %t3326 = load i64, ptr %local.w11
  %t3327 = load i64, ptr %local.u10
  %t3328 = call i64 @"sx_f64_mul"(i64 %t3326, i64 %t3327)
  %t3329 = call i64 @"sx_f64_sub"(i64 %t3325, i64 %t3328)
  %t3330 = call i64 @"sx_f64_mul"(i64 %t3322, i64 %t3329)
  store i64 %t3330, ptr %local.su10.2971
  %t3331 = load i64, ptr %local.sigma
  %t3332 = load i64, ptr %local.w11
  %t3333 = load i64, ptr %local.u10
  %t3334 = call i64 @"sx_f64_mul"(i64 %t3332, i64 %t3333)
  %t3335 = load i64, ptr %local.w10
  %t3336 = load i64, ptr %local.u11
  %t3337 = call i64 @"sx_f64_mul"(i64 %t3335, i64 %t3336)
  %t3338 = call i64 @"sx_f64_sub"(i64 %t3334, i64 %t3337)
  %t3339 = call i64 @"sx_f64_mul"(i64 %t3331, i64 %t3338)
  store i64 %t3339, ptr %local.su11.2972
  %t3340 = load i64, ptr %local.lambda
  %t3341 = load i64, ptr %local.w1
  %t3342 = load i64, ptr %local.u0
  %t3343 = call i64 @"sx_f64_mul"(i64 %t3341, i64 %t3342)
  %t3344 = load i64, ptr %local.w0
  %t3345 = load i64, ptr %local.u1
  %t3346 = call i64 @"sx_f64_mul"(i64 %t3344, i64 %t3345)
  %t3347 = call i64 @"sx_f64_add"(i64 %t3343, i64 %t3346)
  %t3348 = call i64 @"sx_f64_mul"(i64 %t3340, i64 %t3347)
  store i64 %t3348, ptr %local.vw0.2973
  %t3349 = load i64, ptr %local.lambda
  %t3350 = load i64, ptr %local.w0
  %t3351 = load i64, ptr %local.u1
  %t3352 = call i64 @"sx_f64_mul"(i64 %t3350, i64 %t3351)
  %t3353 = load i64, ptr %local.w1
  %t3354 = load i64, ptr %local.u0
  %t3355 = call i64 @"sx_f64_mul"(i64 %t3353, i64 %t3354)
  %t3356 = call i64 @"sx_f64_add"(i64 %t3352, i64 %t3355)
  %t3357 = call i64 @"sx_f64_mul"(i64 %t3349, i64 %t3356)
  store i64 %t3357, ptr %local.vw1.2974
  %t3358 = load i64, ptr %local.lambda
  %t3359 = load i64, ptr %local.w3
  %t3360 = load i64, ptr %local.u2
  %t3361 = call i64 @"sx_f64_mul"(i64 %t3359, i64 %t3360)
  %t3362 = load i64, ptr %local.w2
  %t3363 = load i64, ptr %local.u3
  %t3364 = call i64 @"sx_f64_mul"(i64 %t3362, i64 %t3363)
  %t3365 = call i64 @"sx_f64_add"(i64 %t3361, i64 %t3364)
  %t3366 = call i64 @"sx_f64_mul"(i64 %t3358, i64 %t3365)
  store i64 %t3366, ptr %local.vw2.2975
  %t3367 = load i64, ptr %local.lambda
  %t3368 = load i64, ptr %local.w2
  %t3369 = load i64, ptr %local.u3
  %t3370 = call i64 @"sx_f64_mul"(i64 %t3368, i64 %t3369)
  %t3371 = load i64, ptr %local.w3
  %t3372 = load i64, ptr %local.u2
  %t3373 = call i64 @"sx_f64_mul"(i64 %t3371, i64 %t3372)
  %t3374 = call i64 @"sx_f64_add"(i64 %t3370, i64 %t3373)
  %t3375 = call i64 @"sx_f64_mul"(i64 %t3367, i64 %t3374)
  store i64 %t3375, ptr %local.vw3.2976
  %t3376 = load i64, ptr %local.lambda
  %t3377 = load i64, ptr %local.w5
  %t3378 = load i64, ptr %local.u4
  %t3379 = call i64 @"sx_f64_mul"(i64 %t3377, i64 %t3378)
  %t3380 = load i64, ptr %local.w4
  %t3381 = load i64, ptr %local.u5
  %t3382 = call i64 @"sx_f64_mul"(i64 %t3380, i64 %t3381)
  %t3383 = call i64 @"sx_f64_add"(i64 %t3379, i64 %t3382)
  %t3384 = call i64 @"sx_f64_mul"(i64 %t3376, i64 %t3383)
  store i64 %t3384, ptr %local.vw4.2977
  %t3385 = load i64, ptr %local.lambda
  %t3386 = load i64, ptr %local.w4
  %t3387 = load i64, ptr %local.u5
  %t3388 = call i64 @"sx_f64_mul"(i64 %t3386, i64 %t3387)
  %t3389 = load i64, ptr %local.w5
  %t3390 = load i64, ptr %local.u4
  %t3391 = call i64 @"sx_f64_mul"(i64 %t3389, i64 %t3390)
  %t3392 = call i64 @"sx_f64_add"(i64 %t3388, i64 %t3391)
  %t3393 = call i64 @"sx_f64_mul"(i64 %t3385, i64 %t3392)
  store i64 %t3393, ptr %local.vw5.2978
  %t3394 = load i64, ptr %local.lambda
  %t3395 = load i64, ptr %local.w7
  %t3396 = load i64, ptr %local.u6
  %t3397 = call i64 @"sx_f64_mul"(i64 %t3395, i64 %t3396)
  %t3398 = load i64, ptr %local.w6
  %t3399 = load i64, ptr %local.u7
  %t3400 = call i64 @"sx_f64_mul"(i64 %t3398, i64 %t3399)
  %t3401 = call i64 @"sx_f64_add"(i64 %t3397, i64 %t3400)
  %t3402 = call i64 @"sx_f64_mul"(i64 %t3394, i64 %t3401)
  store i64 %t3402, ptr %local.vw6.2979
  %t3403 = load i64, ptr %local.lambda
  %t3404 = load i64, ptr %local.w6
  %t3405 = load i64, ptr %local.u7
  %t3406 = call i64 @"sx_f64_mul"(i64 %t3404, i64 %t3405)
  %t3407 = load i64, ptr %local.w7
  %t3408 = load i64, ptr %local.u6
  %t3409 = call i64 @"sx_f64_mul"(i64 %t3407, i64 %t3408)
  %t3410 = call i64 @"sx_f64_add"(i64 %t3406, i64 %t3409)
  %t3411 = call i64 @"sx_f64_mul"(i64 %t3403, i64 %t3410)
  store i64 %t3411, ptr %local.vw7.2980
  %t3412 = load i64, ptr %local.lambda
  %t3413 = load i64, ptr %local.w9
  %t3414 = load i64, ptr %local.u8
  %t3415 = call i64 @"sx_f64_mul"(i64 %t3413, i64 %t3414)
  %t3416 = load i64, ptr %local.w8
  %t3417 = load i64, ptr %local.u9
  %t3418 = call i64 @"sx_f64_mul"(i64 %t3416, i64 %t3417)
  %t3419 = call i64 @"sx_f64_add"(i64 %t3415, i64 %t3418)
  %t3420 = call i64 @"sx_f64_mul"(i64 %t3412, i64 %t3419)
  store i64 %t3420, ptr %local.vw8.2981
  %t3421 = load i64, ptr %local.lambda
  %t3422 = load i64, ptr %local.w8
  %t3423 = load i64, ptr %local.u9
  %t3424 = call i64 @"sx_f64_mul"(i64 %t3422, i64 %t3423)
  %t3425 = load i64, ptr %local.w9
  %t3426 = load i64, ptr %local.u8
  %t3427 = call i64 @"sx_f64_mul"(i64 %t3425, i64 %t3426)
  %t3428 = call i64 @"sx_f64_add"(i64 %t3424, i64 %t3427)
  %t3429 = call i64 @"sx_f64_mul"(i64 %t3421, i64 %t3428)
  store i64 %t3429, ptr %local.vw9.2982
  %t3430 = load i64, ptr %local.lambda
  %t3431 = load i64, ptr %local.w11
  %t3432 = load i64, ptr %local.u10
  %t3433 = call i64 @"sx_f64_mul"(i64 %t3431, i64 %t3432)
  %t3434 = load i64, ptr %local.w10
  %t3435 = load i64, ptr %local.u11
  %t3436 = call i64 @"sx_f64_mul"(i64 %t3434, i64 %t3435)
  %t3437 = call i64 @"sx_f64_add"(i64 %t3433, i64 %t3436)
  %t3438 = call i64 @"sx_f64_mul"(i64 %t3430, i64 %t3437)
  store i64 %t3438, ptr %local.vw10.2983
  %t3439 = load i64, ptr %local.lambda
  %t3440 = load i64, ptr %local.w10
  %t3441 = load i64, ptr %local.u11
  %t3442 = call i64 @"sx_f64_mul"(i64 %t3440, i64 %t3441)
  %t3443 = load i64, ptr %local.w11
  %t3444 = load i64, ptr %local.u10
  %t3445 = call i64 @"sx_f64_mul"(i64 %t3443, i64 %t3444)
  %t3446 = call i64 @"sx_f64_add"(i64 %t3442, i64 %t3445)
  %t3447 = call i64 @"sx_f64_mul"(i64 %t3439, i64 %t3446)
  store i64 %t3447, ptr %local.vw11.2984
  %t3448 = load i64, ptr %local.lambda2
  %t3449 = load i64, ptr %local.omega_sq.2936
  %t3450 = call i64 @"sx_f64_mul"(i64 %t3448, i64 %t3449)
  %t3451 = load i64, ptr %local.w0
  %t3452 = call i64 @"sx_f64_mul"(i64 %t3450, i64 %t3451)
  store i64 %t3452, ptr %local.qw0.2985
  %t3453 = load i64, ptr %local.lambda2
  %t3454 = load i64, ptr %local.omega_sq.2936
  %t3455 = call i64 @"sx_f64_mul"(i64 %t3453, i64 %t3454)
  %t3456 = load i64, ptr %local.w1
  %t3457 = call i64 @"sx_f64_mul"(i64 %t3455, i64 %t3456)
  store i64 %t3457, ptr %local.qw1.2986
  %t3458 = load i64, ptr %local.lambda2
  %t3459 = load i64, ptr %local.omega_sq.2936
  %t3460 = call i64 @"sx_f64_mul"(i64 %t3458, i64 %t3459)
  %t3461 = load i64, ptr %local.w2
  %t3462 = call i64 @"sx_f64_mul"(i64 %t3460, i64 %t3461)
  store i64 %t3462, ptr %local.qw2.2987
  %t3463 = load i64, ptr %local.lambda2
  %t3464 = load i64, ptr %local.omega_sq.2936
  %t3465 = call i64 @"sx_f64_mul"(i64 %t3463, i64 %t3464)
  %t3466 = load i64, ptr %local.w3
  %t3467 = call i64 @"sx_f64_mul"(i64 %t3465, i64 %t3466)
  store i64 %t3467, ptr %local.qw3.2988
  %t3468 = load i64, ptr %local.lambda2
  %t3469 = load i64, ptr %local.omega_sq.2936
  %t3470 = call i64 @"sx_f64_mul"(i64 %t3468, i64 %t3469)
  %t3471 = load i64, ptr %local.w4
  %t3472 = call i64 @"sx_f64_mul"(i64 %t3470, i64 %t3471)
  store i64 %t3472, ptr %local.qw4.2989
  %t3473 = load i64, ptr %local.lambda2
  %t3474 = load i64, ptr %local.omega_sq.2936
  %t3475 = call i64 @"sx_f64_mul"(i64 %t3473, i64 %t3474)
  %t3476 = load i64, ptr %local.w5
  %t3477 = call i64 @"sx_f64_mul"(i64 %t3475, i64 %t3476)
  store i64 %t3477, ptr %local.qw5.2990
  %t3478 = load i64, ptr %local.lambda2
  %t3479 = load i64, ptr %local.omega_sq.2936
  %t3480 = call i64 @"sx_f64_mul"(i64 %t3478, i64 %t3479)
  %t3481 = load i64, ptr %local.w6
  %t3482 = call i64 @"sx_f64_mul"(i64 %t3480, i64 %t3481)
  store i64 %t3482, ptr %local.qw6.2991
  %t3483 = load i64, ptr %local.lambda2
  %t3484 = load i64, ptr %local.omega_sq.2936
  %t3485 = call i64 @"sx_f64_mul"(i64 %t3483, i64 %t3484)
  %t3486 = load i64, ptr %local.w7
  %t3487 = call i64 @"sx_f64_mul"(i64 %t3485, i64 %t3486)
  store i64 %t3487, ptr %local.qw7.2992
  %t3488 = load i64, ptr %local.lambda2
  %t3489 = load i64, ptr %local.omega_sq.2936
  %t3490 = call i64 @"sx_f64_mul"(i64 %t3488, i64 %t3489)
  %t3491 = load i64, ptr %local.w8
  %t3492 = call i64 @"sx_f64_mul"(i64 %t3490, i64 %t3491)
  store i64 %t3492, ptr %local.qw8.2993
  %t3493 = load i64, ptr %local.lambda2
  %t3494 = load i64, ptr %local.omega_sq.2936
  %t3495 = call i64 @"sx_f64_mul"(i64 %t3493, i64 %t3494)
  %t3496 = load i64, ptr %local.w9
  %t3497 = call i64 @"sx_f64_mul"(i64 %t3495, i64 %t3496)
  store i64 %t3497, ptr %local.qw9.2994
  %t3498 = load i64, ptr %local.lambda2
  %t3499 = load i64, ptr %local.omega_sq.2936
  %t3500 = call i64 @"sx_f64_mul"(i64 %t3498, i64 %t3499)
  %t3501 = load i64, ptr %local.w10
  %t3502 = call i64 @"sx_f64_mul"(i64 %t3500, i64 %t3501)
  store i64 %t3502, ptr %local.qw10.2995
  %t3503 = load i64, ptr %local.lambda2
  %t3504 = load i64, ptr %local.omega_sq.2936
  %t3505 = call i64 @"sx_f64_mul"(i64 %t3503, i64 %t3504)
  %t3506 = load i64, ptr %local.w11
  %t3507 = call i64 @"sx_f64_mul"(i64 %t3505, i64 %t3506)
  store i64 %t3507, ptr %local.qw11.2996
  %t3508 = load i64, ptr %local.beta
  %t3509 = load i64, ptr %local.w0
  %t3510 = call i64 @"sx_f64_mul"(i64 %t3508, i64 %t3509)
  %t3511 = load i64, ptr %local.w1
  %t3512 = call i64 @"sx_f64_mul"(i64 %t3510, i64 %t3511)
  store i64 %t3512, ptr %local.c_w2.2997
  %t3513 = load i64, ptr %local.beta
  %t3514 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.232)
  %t3515 = load i64, ptr %local.w0
  %t3516 = load i64, ptr %local.w1
  %t3517 = call i64 @"sx_f64_mul"(i64 %t3515, i64 %t3516)
  %t3518 = call i64 @"sx_f64_sub"(i64 %t3514, i64 %t3517)
  %t3519 = call i64 @"sx_f64_mul"(i64 %t3513, i64 %t3518)
  store i64 %t3519, ptr %local.c_w3.2998
  %t3520 = load i64, ptr %local.beta
  %t3521 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.233)
  %t3522 = call i64 @"sx_f64_mul"(i64 %t3520, i64 %t3521)
  %t3523 = load i64, ptr %local.w2
  %t3524 = call i64 @"sx_f64_mul"(i64 %t3522, i64 %t3523)
  %t3525 = load i64, ptr %local.w3
  %t3526 = call i64 @"sx_f64_mul"(i64 %t3524, i64 %t3525)
  store i64 %t3526, ptr %local.c_w4.2999
  %t3527 = load i64, ptr %local.beta
  %t3528 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.234)
  %t3529 = call i64 @"sx_f64_mul"(i64 %t3527, i64 %t3528)
  %t3530 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.235)
  %t3531 = load i64, ptr %local.w2
  %t3532 = load i64, ptr %local.w3
  %t3533 = call i64 @"sx_f64_mul"(i64 %t3531, i64 %t3532)
  %t3534 = call i64 @"sx_f64_sub"(i64 %t3530, i64 %t3533)
  %t3535 = call i64 @"sx_f64_mul"(i64 %t3529, i64 %t3534)
  store i64 %t3535, ptr %local.c_w5.3000
  %t3536 = load i64, ptr %local.beta
  %t3537 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.236)
  %t3538 = call i64 @"sx_f64_mul"(i64 %t3536, i64 %t3537)
  %t3539 = load i64, ptr %local.w4
  %t3540 = call i64 @"sx_f64_mul"(i64 %t3538, i64 %t3539)
  %t3541 = load i64, ptr %local.w5
  %t3542 = call i64 @"sx_f64_mul"(i64 %t3540, i64 %t3541)
  store i64 %t3542, ptr %local.c_w6.3001
  %t3543 = load i64, ptr %local.beta
  %t3544 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.237)
  %t3545 = call i64 @"sx_f64_mul"(i64 %t3543, i64 %t3544)
  %t3546 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.238)
  %t3547 = load i64, ptr %local.w4
  %t3548 = load i64, ptr %local.w5
  %t3549 = call i64 @"sx_f64_mul"(i64 %t3547, i64 %t3548)
  %t3550 = call i64 @"sx_f64_sub"(i64 %t3546, i64 %t3549)
  %t3551 = call i64 @"sx_f64_mul"(i64 %t3545, i64 %t3550)
  store i64 %t3551, ptr %local.c_w7.3002
  %t3552 = load i64, ptr %local.beta
  %t3553 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.239)
  %t3554 = call i64 @"sx_f64_mul"(i64 %t3552, i64 %t3553)
  %t3555 = load i64, ptr %local.w6
  %t3556 = call i64 @"sx_f64_mul"(i64 %t3554, i64 %t3555)
  %t3557 = load i64, ptr %local.w7
  %t3558 = call i64 @"sx_f64_mul"(i64 %t3556, i64 %t3557)
  store i64 %t3558, ptr %local.c_w8.3003
  %t3559 = load i64, ptr %local.beta
  %t3560 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.240)
  %t3561 = call i64 @"sx_f64_mul"(i64 %t3559, i64 %t3560)
  %t3562 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.241)
  %t3563 = load i64, ptr %local.w6
  %t3564 = load i64, ptr %local.w7
  %t3565 = call i64 @"sx_f64_mul"(i64 %t3563, i64 %t3564)
  %t3566 = call i64 @"sx_f64_sub"(i64 %t3562, i64 %t3565)
  %t3567 = call i64 @"sx_f64_mul"(i64 %t3561, i64 %t3566)
  store i64 %t3567, ptr %local.c_w9.3004
  %t3568 = load i64, ptr %local.beta
  %t3569 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.242)
  %t3570 = call i64 @"sx_f64_mul"(i64 %t3568, i64 %t3569)
  %t3571 = load i64, ptr %local.w8
  %t3572 = call i64 @"sx_f64_mul"(i64 %t3570, i64 %t3571)
  %t3573 = load i64, ptr %local.w9
  %t3574 = call i64 @"sx_f64_mul"(i64 %t3572, i64 %t3573)
  store i64 %t3574, ptr %local.c_w10.3005
  %t3575 = load i64, ptr %local.beta
  %t3576 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.243)
  %t3577 = call i64 @"sx_f64_mul"(i64 %t3575, i64 %t3576)
  %t3578 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.244)
  %t3579 = load i64, ptr %local.w8
  %t3580 = load i64, ptr %local.w9
  %t3581 = call i64 @"sx_f64_mul"(i64 %t3579, i64 %t3580)
  %t3582 = call i64 @"sx_f64_sub"(i64 %t3578, i64 %t3581)
  %t3583 = call i64 @"sx_f64_mul"(i64 %t3577, i64 %t3582)
  store i64 %t3583, ptr %local.c_w11.3006
  %t3584 = load i64, ptr %local.beta
  %t3585 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.245)
  %t3586 = call i64 @"sx_f64_mul"(i64 %t3584, i64 %t3585)
  %t3587 = load i64, ptr %local.w0
  %t3588 = call i64 @"sx_f64_mul"(i64 %t3586, i64 %t3587)
  %t3589 = load i64, ptr %local.w1
  %t3590 = call i64 @"sx_f64_mul"(i64 %t3588, i64 %t3589)
  store i64 %t3590, ptr %local.t_w4.3007
  %t3591 = load i64, ptr %local.beta
  %t3592 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.246)
  %t3593 = call i64 @"sx_f64_mul"(i64 %t3591, i64 %t3592)
  %t3594 = load i64, ptr %local.w0
  %t3595 = call i64 @"sx_f64_mul"(i64 %t3593, i64 %t3594)
  %t3596 = load i64, ptr %local.w1
  %t3597 = call i64 @"sx_f64_mul"(i64 %t3595, i64 %t3596)
  store i64 %t3597, ptr %local.t_w6.3008
  %t3598 = load i64, ptr %local.beta
  %t3599 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.247)
  %t3600 = call i64 @"sx_f64_mul"(i64 %t3598, i64 %t3599)
  %t3601 = load i64, ptr %local.w2
  %t3602 = call i64 @"sx_f64_mul"(i64 %t3600, i64 %t3601)
  %t3603 = load i64, ptr %local.w3
  %t3604 = call i64 @"sx_f64_mul"(i64 %t3602, i64 %t3603)
  store i64 %t3604, ptr %local.t2_w6.3009
  %t3605 = load i64, ptr %local.beta
  %t3606 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.248)
  %t3607 = call i64 @"sx_f64_mul"(i64 %t3605, i64 %t3606)
  %t3608 = load i64, ptr %local.w0
  %t3609 = call i64 @"sx_f64_mul"(i64 %t3607, i64 %t3608)
  %t3610 = load i64, ptr %local.w1
  %t3611 = call i64 @"sx_f64_mul"(i64 %t3609, i64 %t3610)
  store i64 %t3611, ptr %local.t_w8.3010
  %t3612 = load i64, ptr %local.beta
  %t3613 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.249)
  %t3614 = call i64 @"sx_f64_mul"(i64 %t3612, i64 %t3613)
  %t3615 = load i64, ptr %local.w2
  %t3616 = call i64 @"sx_f64_mul"(i64 %t3614, i64 %t3615)
  %t3617 = load i64, ptr %local.w3
  %t3618 = call i64 @"sx_f64_mul"(i64 %t3616, i64 %t3617)
  store i64 %t3618, ptr %local.t2_w8.3011
  %t3619 = load i64, ptr %local.beta
  %t3620 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.250)
  %t3621 = call i64 @"sx_f64_mul"(i64 %t3619, i64 %t3620)
  %t3622 = load i64, ptr %local.w4
  %t3623 = call i64 @"sx_f64_mul"(i64 %t3621, i64 %t3622)
  %t3624 = load i64, ptr %local.w5
  %t3625 = call i64 @"sx_f64_mul"(i64 %t3623, i64 %t3624)
  store i64 %t3625, ptr %local.t3_w8.3012
  %t3626 = load i64, ptr %local.beta
  %t3627 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.251)
  %t3628 = call i64 @"sx_f64_mul"(i64 %t3626, i64 %t3627)
  %t3629 = load i64, ptr %local.w0
  %t3630 = call i64 @"sx_f64_mul"(i64 %t3628, i64 %t3629)
  %t3631 = load i64, ptr %local.w1
  %t3632 = call i64 @"sx_f64_mul"(i64 %t3630, i64 %t3631)
  store i64 %t3632, ptr %local.t_w10.3013
  %t3633 = load i64, ptr %local.beta
  %t3634 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.252)
  %t3635 = call i64 @"sx_f64_mul"(i64 %t3633, i64 %t3634)
  %t3636 = load i64, ptr %local.w2
  %t3637 = call i64 @"sx_f64_mul"(i64 %t3635, i64 %t3636)
  %t3638 = load i64, ptr %local.w3
  %t3639 = call i64 @"sx_f64_mul"(i64 %t3637, i64 %t3638)
  store i64 %t3639, ptr %local.t2_w10.3014
  %t3640 = load i64, ptr %local.beta
  %t3641 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.253)
  %t3642 = call i64 @"sx_f64_mul"(i64 %t3640, i64 %t3641)
  %t3643 = load i64, ptr %local.w4
  %t3644 = call i64 @"sx_f64_mul"(i64 %t3642, i64 %t3643)
  %t3645 = load i64, ptr %local.w5
  %t3646 = call i64 @"sx_f64_mul"(i64 %t3644, i64 %t3645)
  store i64 %t3646, ptr %local.t3_w10.3015
  %t3647 = load i64, ptr %local.beta
  %t3648 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.254)
  %t3649 = call i64 @"sx_f64_mul"(i64 %t3647, i64 %t3648)
  %t3650 = load i64, ptr %local.w6
  %t3651 = call i64 @"sx_f64_mul"(i64 %t3649, i64 %t3650)
  %t3652 = load i64, ptr %local.w7
  %t3653 = call i64 @"sx_f64_mul"(i64 %t3651, i64 %t3652)
  store i64 %t3653, ptr %local.t4_w10.3016
  %t3654 = load i64, ptr %local.which
  %t3655 = icmp eq i64 %t3654, 0
  %t3656 = zext i1 %t3655 to i64
  %t3657 = icmp ne i64 %t3656, 0
  br i1 %t3657, label %then69, label %else69
then69:
  %t3658 = load i64, ptr %local.u0
  %t3659 = load i64, ptr %local.dt
  %t3660 = load i64, ptr %local.du0.2937
  %t3661 = load i64, ptr %local.su0.2961
  %t3662 = call i64 @"sx_f64_add"(i64 %t3660, i64 %t3661)
  %t3663 = call i64 @"sx_f64_mul"(i64 %t3659, i64 %t3662)
  %t3664 = call i64 @"sx_f64_add"(i64 %t3658, i64 %t3663)
  ret i64 %t3664
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t3665 = phi i64 [ 0, %else69_end ]
  %t3666 = load i64, ptr %local.which
  %t3667 = icmp eq i64 %t3666, 1
  %t3668 = zext i1 %t3667 to i64
  %t3669 = icmp ne i64 %t3668, 0
  br i1 %t3669, label %then70, label %else70
then70:
  %t3670 = load i64, ptr %local.u1
  %t3671 = load i64, ptr %local.dt
  %t3672 = load i64, ptr %local.du1.2938
  %t3673 = load i64, ptr %local.su1.2962
  %t3674 = call i64 @"sx_f64_add"(i64 %t3672, i64 %t3673)
  %t3675 = call i64 @"sx_f64_mul"(i64 %t3671, i64 %t3674)
  %t3676 = call i64 @"sx_f64_add"(i64 %t3670, i64 %t3675)
  ret i64 %t3676
else70:
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t3677 = phi i64 [ 0, %else70_end ]
  %t3678 = load i64, ptr %local.which
  %t3679 = icmp eq i64 %t3678, 2
  %t3680 = zext i1 %t3679 to i64
  %t3681 = icmp ne i64 %t3680, 0
  br i1 %t3681, label %then71, label %else71
then71:
  %t3682 = load i64, ptr %local.u2
  %t3683 = load i64, ptr %local.dt
  %t3684 = load i64, ptr %local.du2.2939
  %t3685 = load i64, ptr %local.su2.2963
  %t3686 = call i64 @"sx_f64_add"(i64 %t3684, i64 %t3685)
  %t3687 = call i64 @"sx_f64_mul"(i64 %t3683, i64 %t3686)
  %t3688 = call i64 @"sx_f64_add"(i64 %t3682, i64 %t3687)
  ret i64 %t3688
else71:
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t3689 = phi i64 [ 0, %else71_end ]
  %t3690 = load i64, ptr %local.which
  %t3691 = icmp eq i64 %t3690, 3
  %t3692 = zext i1 %t3691 to i64
  %t3693 = icmp ne i64 %t3692, 0
  br i1 %t3693, label %then72, label %else72
then72:
  %t3694 = load i64, ptr %local.u3
  %t3695 = load i64, ptr %local.dt
  %t3696 = load i64, ptr %local.du3.2940
  %t3697 = load i64, ptr %local.su3.2964
  %t3698 = call i64 @"sx_f64_add"(i64 %t3696, i64 %t3697)
  %t3699 = call i64 @"sx_f64_mul"(i64 %t3695, i64 %t3698)
  %t3700 = call i64 @"sx_f64_add"(i64 %t3694, i64 %t3699)
  ret i64 %t3700
else72:
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t3701 = phi i64 [ 0, %else72_end ]
  %t3702 = load i64, ptr %local.which
  %t3703 = icmp eq i64 %t3702, 4
  %t3704 = zext i1 %t3703 to i64
  %t3705 = icmp ne i64 %t3704, 0
  br i1 %t3705, label %then73, label %else73
then73:
  %t3706 = load i64, ptr %local.u4
  %t3707 = load i64, ptr %local.dt
  %t3708 = load i64, ptr %local.du4.2941
  %t3709 = load i64, ptr %local.su4.2965
  %t3710 = call i64 @"sx_f64_add"(i64 %t3708, i64 %t3709)
  %t3711 = call i64 @"sx_f64_mul"(i64 %t3707, i64 %t3710)
  %t3712 = call i64 @"sx_f64_add"(i64 %t3706, i64 %t3711)
  ret i64 %t3712
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t3713 = phi i64 [ 0, %else73_end ]
  %t3714 = load i64, ptr %local.which
  %t3715 = icmp eq i64 %t3714, 5
  %t3716 = zext i1 %t3715 to i64
  %t3717 = icmp ne i64 %t3716, 0
  br i1 %t3717, label %then74, label %else74
then74:
  %t3718 = load i64, ptr %local.u5
  %t3719 = load i64, ptr %local.dt
  %t3720 = load i64, ptr %local.du5.2942
  %t3721 = load i64, ptr %local.su5.2966
  %t3722 = call i64 @"sx_f64_add"(i64 %t3720, i64 %t3721)
  %t3723 = call i64 @"sx_f64_mul"(i64 %t3719, i64 %t3722)
  %t3724 = call i64 @"sx_f64_add"(i64 %t3718, i64 %t3723)
  ret i64 %t3724
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t3725 = phi i64 [ 0, %else74_end ]
  %t3726 = load i64, ptr %local.which
  %t3727 = icmp eq i64 %t3726, 6
  %t3728 = zext i1 %t3727 to i64
  %t3729 = icmp ne i64 %t3728, 0
  br i1 %t3729, label %then75, label %else75
then75:
  %t3730 = load i64, ptr %local.u6
  %t3731 = load i64, ptr %local.dt
  %t3732 = load i64, ptr %local.du6.2943
  %t3733 = load i64, ptr %local.su6.2967
  %t3734 = call i64 @"sx_f64_add"(i64 %t3732, i64 %t3733)
  %t3735 = call i64 @"sx_f64_mul"(i64 %t3731, i64 %t3734)
  %t3736 = call i64 @"sx_f64_add"(i64 %t3730, i64 %t3735)
  ret i64 %t3736
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t3737 = phi i64 [ 0, %else75_end ]
  %t3738 = load i64, ptr %local.which
  %t3739 = icmp eq i64 %t3738, 7
  %t3740 = zext i1 %t3739 to i64
  %t3741 = icmp ne i64 %t3740, 0
  br i1 %t3741, label %then76, label %else76
then76:
  %t3742 = load i64, ptr %local.u7
  %t3743 = load i64, ptr %local.dt
  %t3744 = load i64, ptr %local.du7.2944
  %t3745 = load i64, ptr %local.su7.2968
  %t3746 = call i64 @"sx_f64_add"(i64 %t3744, i64 %t3745)
  %t3747 = call i64 @"sx_f64_mul"(i64 %t3743, i64 %t3746)
  %t3748 = call i64 @"sx_f64_add"(i64 %t3742, i64 %t3747)
  ret i64 %t3748
else76:
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t3749 = phi i64 [ 0, %else76_end ]
  %t3750 = load i64, ptr %local.which
  %t3751 = icmp eq i64 %t3750, 8
  %t3752 = zext i1 %t3751 to i64
  %t3753 = icmp ne i64 %t3752, 0
  br i1 %t3753, label %then77, label %else77
then77:
  %t3754 = load i64, ptr %local.u8
  %t3755 = load i64, ptr %local.dt
  %t3756 = load i64, ptr %local.du8.2945
  %t3757 = load i64, ptr %local.su8.2969
  %t3758 = call i64 @"sx_f64_add"(i64 %t3756, i64 %t3757)
  %t3759 = call i64 @"sx_f64_mul"(i64 %t3755, i64 %t3758)
  %t3760 = call i64 @"sx_f64_add"(i64 %t3754, i64 %t3759)
  ret i64 %t3760
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t3761 = phi i64 [ 0, %else77_end ]
  %t3762 = load i64, ptr %local.which
  %t3763 = icmp eq i64 %t3762, 9
  %t3764 = zext i1 %t3763 to i64
  %t3765 = icmp ne i64 %t3764, 0
  br i1 %t3765, label %then78, label %else78
then78:
  %t3766 = load i64, ptr %local.u9
  %t3767 = load i64, ptr %local.dt
  %t3768 = load i64, ptr %local.du9.2946
  %t3769 = load i64, ptr %local.su9.2970
  %t3770 = call i64 @"sx_f64_add"(i64 %t3768, i64 %t3769)
  %t3771 = call i64 @"sx_f64_mul"(i64 %t3767, i64 %t3770)
  %t3772 = call i64 @"sx_f64_add"(i64 %t3766, i64 %t3771)
  ret i64 %t3772
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t3773 = phi i64 [ 0, %else78_end ]
  %t3774 = load i64, ptr %local.which
  %t3775 = icmp eq i64 %t3774, 10
  %t3776 = zext i1 %t3775 to i64
  %t3777 = icmp ne i64 %t3776, 0
  br i1 %t3777, label %then79, label %else79
then79:
  %t3778 = load i64, ptr %local.u10
  %t3779 = load i64, ptr %local.dt
  %t3780 = load i64, ptr %local.du10.2947
  %t3781 = load i64, ptr %local.su10.2971
  %t3782 = call i64 @"sx_f64_add"(i64 %t3780, i64 %t3781)
  %t3783 = call i64 @"sx_f64_mul"(i64 %t3779, i64 %t3782)
  %t3784 = call i64 @"sx_f64_add"(i64 %t3778, i64 %t3783)
  ret i64 %t3784
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t3785 = phi i64 [ 0, %else79_end ]
  %t3786 = load i64, ptr %local.which
  %t3787 = icmp eq i64 %t3786, 11
  %t3788 = zext i1 %t3787 to i64
  %t3789 = icmp ne i64 %t3788, 0
  br i1 %t3789, label %then80, label %else80
then80:
  %t3790 = load i64, ptr %local.u11
  %t3791 = load i64, ptr %local.dt
  %t3792 = load i64, ptr %local.du11.2948
  %t3793 = load i64, ptr %local.su11.2972
  %t3794 = call i64 @"sx_f64_add"(i64 %t3792, i64 %t3793)
  %t3795 = call i64 @"sx_f64_mul"(i64 %t3791, i64 %t3794)
  %t3796 = call i64 @"sx_f64_add"(i64 %t3790, i64 %t3795)
  ret i64 %t3796
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t3797 = phi i64 [ 0, %else80_end ]
  %t3798 = load i64, ptr %local.which
  %t3799 = icmp eq i64 %t3798, 12
  %t3800 = zext i1 %t3799 to i64
  %t3801 = icmp ne i64 %t3800, 0
  br i1 %t3801, label %then81, label %else81
then81:
  %t3802 = load i64, ptr %local.w0
  %t3803 = load i64, ptr %local.dt
  %t3804 = load i64, ptr %local.dw0.2949
  %t3805 = load i64, ptr %local.vw0.2973
  %t3806 = call i64 @"sx_f64_add"(i64 %t3804, i64 %t3805)
  %t3807 = load i64, ptr %local.qw0.2985
  %t3808 = call i64 @"sx_f64_add"(i64 %t3806, i64 %t3807)
  %t3809 = call i64 @"sx_f64_mul"(i64 %t3803, i64 %t3808)
  %t3810 = call i64 @"sx_f64_add"(i64 %t3802, i64 %t3809)
  ret i64 %t3810
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t3811 = phi i64 [ 0, %else81_end ]
  %t3812 = load i64, ptr %local.which
  %t3813 = icmp eq i64 %t3812, 13
  %t3814 = zext i1 %t3813 to i64
  %t3815 = icmp ne i64 %t3814, 0
  br i1 %t3815, label %then82, label %else82
then82:
  %t3816 = load i64, ptr %local.w1
  %t3817 = load i64, ptr %local.dt
  %t3818 = load i64, ptr %local.dw1.2950
  %t3819 = load i64, ptr %local.vw1.2974
  %t3820 = call i64 @"sx_f64_add"(i64 %t3818, i64 %t3819)
  %t3821 = load i64, ptr %local.qw1.2986
  %t3822 = call i64 @"sx_f64_add"(i64 %t3820, i64 %t3821)
  %t3823 = call i64 @"sx_f64_mul"(i64 %t3817, i64 %t3822)
  %t3824 = call i64 @"sx_f64_add"(i64 %t3816, i64 %t3823)
  ret i64 %t3824
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t3825 = phi i64 [ 0, %else82_end ]
  %t3826 = load i64, ptr %local.which
  %t3827 = icmp eq i64 %t3826, 14
  %t3828 = zext i1 %t3827 to i64
  %t3829 = icmp ne i64 %t3828, 0
  br i1 %t3829, label %then83, label %else83
then83:
  %t3830 = load i64, ptr %local.w2
  %t3831 = load i64, ptr %local.dt
  %t3832 = load i64, ptr %local.dw2.2951
  %t3833 = load i64, ptr %local.vw2.2975
  %t3834 = call i64 @"sx_f64_add"(i64 %t3832, i64 %t3833)
  %t3835 = load i64, ptr %local.qw2.2987
  %t3836 = call i64 @"sx_f64_add"(i64 %t3834, i64 %t3835)
  %t3837 = load i64, ptr %local.c_w2.2997
  %t3838 = call i64 @"sx_f64_add"(i64 %t3836, i64 %t3837)
  %t3839 = call i64 @"sx_f64_mul"(i64 %t3831, i64 %t3838)
  %t3840 = call i64 @"sx_f64_add"(i64 %t3830, i64 %t3839)
  ret i64 %t3840
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t3841 = phi i64 [ 0, %else83_end ]
  %t3842 = load i64, ptr %local.which
  %t3843 = icmp eq i64 %t3842, 15
  %t3844 = zext i1 %t3843 to i64
  %t3845 = icmp ne i64 %t3844, 0
  br i1 %t3845, label %then84, label %else84
then84:
  %t3846 = load i64, ptr %local.w3
  %t3847 = load i64, ptr %local.dt
  %t3848 = load i64, ptr %local.dw3.2952
  %t3849 = load i64, ptr %local.vw3.2976
  %t3850 = call i64 @"sx_f64_add"(i64 %t3848, i64 %t3849)
  %t3851 = load i64, ptr %local.qw3.2988
  %t3852 = call i64 @"sx_f64_add"(i64 %t3850, i64 %t3851)
  %t3853 = load i64, ptr %local.c_w3.2998
  %t3854 = call i64 @"sx_f64_add"(i64 %t3852, i64 %t3853)
  %t3855 = call i64 @"sx_f64_mul"(i64 %t3847, i64 %t3854)
  %t3856 = call i64 @"sx_f64_add"(i64 %t3846, i64 %t3855)
  ret i64 %t3856
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t3857 = phi i64 [ 0, %else84_end ]
  %t3858 = load i64, ptr %local.which
  %t3859 = icmp eq i64 %t3858, 16
  %t3860 = zext i1 %t3859 to i64
  %t3861 = icmp ne i64 %t3860, 0
  br i1 %t3861, label %then85, label %else85
then85:
  %t3862 = load i64, ptr %local.w4
  %t3863 = load i64, ptr %local.dt
  %t3864 = load i64, ptr %local.dw4.2953
  %t3865 = load i64, ptr %local.vw4.2977
  %t3866 = call i64 @"sx_f64_add"(i64 %t3864, i64 %t3865)
  %t3867 = load i64, ptr %local.qw4.2989
  %t3868 = call i64 @"sx_f64_add"(i64 %t3866, i64 %t3867)
  %t3869 = load i64, ptr %local.c_w4.2999
  %t3870 = call i64 @"sx_f64_add"(i64 %t3868, i64 %t3869)
  %t3871 = load i64, ptr %local.t_w4.3007
  %t3872 = call i64 @"sx_f64_add"(i64 %t3870, i64 %t3871)
  %t3873 = call i64 @"sx_f64_mul"(i64 %t3863, i64 %t3872)
  %t3874 = call i64 @"sx_f64_add"(i64 %t3862, i64 %t3873)
  ret i64 %t3874
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t3875 = phi i64 [ 0, %else85_end ]
  %t3876 = load i64, ptr %local.which
  %t3877 = icmp eq i64 %t3876, 17
  %t3878 = zext i1 %t3877 to i64
  %t3879 = icmp ne i64 %t3878, 0
  br i1 %t3879, label %then86, label %else86
then86:
  %t3880 = load i64, ptr %local.w5
  %t3881 = load i64, ptr %local.dt
  %t3882 = load i64, ptr %local.dw5.2954
  %t3883 = load i64, ptr %local.vw5.2978
  %t3884 = call i64 @"sx_f64_add"(i64 %t3882, i64 %t3883)
  %t3885 = load i64, ptr %local.qw5.2990
  %t3886 = call i64 @"sx_f64_add"(i64 %t3884, i64 %t3885)
  %t3887 = load i64, ptr %local.c_w5.3000
  %t3888 = call i64 @"sx_f64_add"(i64 %t3886, i64 %t3887)
  %t3889 = call i64 @"sx_f64_mul"(i64 %t3881, i64 %t3888)
  %t3890 = call i64 @"sx_f64_add"(i64 %t3880, i64 %t3889)
  ret i64 %t3890
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t3891 = phi i64 [ 0, %else86_end ]
  %t3892 = load i64, ptr %local.which
  %t3893 = icmp eq i64 %t3892, 18
  %t3894 = zext i1 %t3893 to i64
  %t3895 = icmp ne i64 %t3894, 0
  br i1 %t3895, label %then87, label %else87
then87:
  %t3896 = load i64, ptr %local.w6
  %t3897 = load i64, ptr %local.dt
  %t3898 = load i64, ptr %local.dw6.2955
  %t3899 = load i64, ptr %local.vw6.2979
  %t3900 = call i64 @"sx_f64_add"(i64 %t3898, i64 %t3899)
  %t3901 = load i64, ptr %local.qw6.2991
  %t3902 = call i64 @"sx_f64_add"(i64 %t3900, i64 %t3901)
  %t3903 = load i64, ptr %local.c_w6.3001
  %t3904 = call i64 @"sx_f64_add"(i64 %t3902, i64 %t3903)
  %t3905 = load i64, ptr %local.t_w6.3008
  %t3906 = call i64 @"sx_f64_add"(i64 %t3904, i64 %t3905)
  %t3907 = load i64, ptr %local.t2_w6.3009
  %t3908 = call i64 @"sx_f64_add"(i64 %t3906, i64 %t3907)
  %t3909 = call i64 @"sx_f64_mul"(i64 %t3897, i64 %t3908)
  %t3910 = call i64 @"sx_f64_add"(i64 %t3896, i64 %t3909)
  ret i64 %t3910
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t3911 = phi i64 [ 0, %else87_end ]
  %t3912 = load i64, ptr %local.which
  %t3913 = icmp eq i64 %t3912, 19
  %t3914 = zext i1 %t3913 to i64
  %t3915 = icmp ne i64 %t3914, 0
  br i1 %t3915, label %then88, label %else88
then88:
  %t3916 = load i64, ptr %local.w7
  %t3917 = load i64, ptr %local.dt
  %t3918 = load i64, ptr %local.dw7.2956
  %t3919 = load i64, ptr %local.vw7.2980
  %t3920 = call i64 @"sx_f64_add"(i64 %t3918, i64 %t3919)
  %t3921 = load i64, ptr %local.qw7.2992
  %t3922 = call i64 @"sx_f64_add"(i64 %t3920, i64 %t3921)
  %t3923 = load i64, ptr %local.c_w7.3002
  %t3924 = call i64 @"sx_f64_add"(i64 %t3922, i64 %t3923)
  %t3925 = call i64 @"sx_f64_mul"(i64 %t3917, i64 %t3924)
  %t3926 = call i64 @"sx_f64_add"(i64 %t3916, i64 %t3925)
  ret i64 %t3926
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t3927 = phi i64 [ 0, %else88_end ]
  %t3928 = load i64, ptr %local.which
  %t3929 = icmp eq i64 %t3928, 20
  %t3930 = zext i1 %t3929 to i64
  %t3931 = icmp ne i64 %t3930, 0
  br i1 %t3931, label %then89, label %else89
then89:
  %t3932 = load i64, ptr %local.w8
  %t3933 = load i64, ptr %local.dt
  %t3934 = load i64, ptr %local.dw8.2957
  %t3935 = load i64, ptr %local.vw8.2981
  %t3936 = call i64 @"sx_f64_add"(i64 %t3934, i64 %t3935)
  %t3937 = load i64, ptr %local.qw8.2993
  %t3938 = call i64 @"sx_f64_add"(i64 %t3936, i64 %t3937)
  %t3939 = load i64, ptr %local.c_w8.3003
  %t3940 = call i64 @"sx_f64_add"(i64 %t3938, i64 %t3939)
  %t3941 = load i64, ptr %local.t_w8.3010
  %t3942 = call i64 @"sx_f64_add"(i64 %t3940, i64 %t3941)
  %t3943 = load i64, ptr %local.t2_w8.3011
  %t3944 = call i64 @"sx_f64_add"(i64 %t3942, i64 %t3943)
  %t3945 = load i64, ptr %local.t3_w8.3012
  %t3946 = call i64 @"sx_f64_add"(i64 %t3944, i64 %t3945)
  %t3947 = call i64 @"sx_f64_mul"(i64 %t3933, i64 %t3946)
  %t3948 = call i64 @"sx_f64_add"(i64 %t3932, i64 %t3947)
  ret i64 %t3948
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t3949 = phi i64 [ 0, %else89_end ]
  %t3950 = load i64, ptr %local.which
  %t3951 = icmp eq i64 %t3950, 21
  %t3952 = zext i1 %t3951 to i64
  %t3953 = icmp ne i64 %t3952, 0
  br i1 %t3953, label %then90, label %else90
then90:
  %t3954 = load i64, ptr %local.w9
  %t3955 = load i64, ptr %local.dt
  %t3956 = load i64, ptr %local.dw9.2958
  %t3957 = load i64, ptr %local.vw9.2982
  %t3958 = call i64 @"sx_f64_add"(i64 %t3956, i64 %t3957)
  %t3959 = load i64, ptr %local.qw9.2994
  %t3960 = call i64 @"sx_f64_add"(i64 %t3958, i64 %t3959)
  %t3961 = load i64, ptr %local.c_w9.3004
  %t3962 = call i64 @"sx_f64_add"(i64 %t3960, i64 %t3961)
  %t3963 = call i64 @"sx_f64_mul"(i64 %t3955, i64 %t3962)
  %t3964 = call i64 @"sx_f64_add"(i64 %t3954, i64 %t3963)
  ret i64 %t3964
else90:
  br label %else90_end
else90_end:
  br label %endif90
endif90:
  %t3965 = phi i64 [ 0, %else90_end ]
  %t3966 = load i64, ptr %local.which
  %t3967 = icmp eq i64 %t3966, 22
  %t3968 = zext i1 %t3967 to i64
  %t3969 = icmp ne i64 %t3968, 0
  br i1 %t3969, label %then91, label %else91
then91:
  %t3970 = load i64, ptr %local.w10
  %t3971 = load i64, ptr %local.dt
  %t3972 = load i64, ptr %local.dw10.2959
  %t3973 = load i64, ptr %local.vw10.2983
  %t3974 = call i64 @"sx_f64_add"(i64 %t3972, i64 %t3973)
  %t3975 = load i64, ptr %local.qw10.2995
  %t3976 = call i64 @"sx_f64_add"(i64 %t3974, i64 %t3975)
  %t3977 = load i64, ptr %local.c_w10.3005
  %t3978 = call i64 @"sx_f64_add"(i64 %t3976, i64 %t3977)
  %t3979 = load i64, ptr %local.t_w10.3013
  %t3980 = call i64 @"sx_f64_add"(i64 %t3978, i64 %t3979)
  %t3981 = load i64, ptr %local.t2_w10.3014
  %t3982 = call i64 @"sx_f64_add"(i64 %t3980, i64 %t3981)
  %t3983 = load i64, ptr %local.t3_w10.3015
  %t3984 = call i64 @"sx_f64_add"(i64 %t3982, i64 %t3983)
  %t3985 = load i64, ptr %local.t4_w10.3016
  %t3986 = call i64 @"sx_f64_add"(i64 %t3984, i64 %t3985)
  %t3987 = call i64 @"sx_f64_mul"(i64 %t3971, i64 %t3986)
  %t3988 = call i64 @"sx_f64_add"(i64 %t3970, i64 %t3987)
  ret i64 %t3988
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t3989 = phi i64 [ 0, %else91_end ]
  %t3990 = load i64, ptr %local.w11
  %t3991 = load i64, ptr %local.dt
  %t3992 = load i64, ptr %local.dw11.2960
  %t3993 = load i64, ptr %local.vw11.2984
  %t3994 = call i64 @"sx_f64_add"(i64 %t3992, i64 %t3993)
  %t3995 = load i64, ptr %local.qw11.2996
  %t3996 = call i64 @"sx_f64_add"(i64 %t3994, i64 %t3995)
  %t3997 = load i64, ptr %local.c_w11.3006
  %t3998 = call i64 @"sx_f64_add"(i64 %t3996, i64 %t3997)
  %t3999 = call i64 @"sx_f64_mul"(i64 %t3991, i64 %t3998)
  %t4000 = call i64 @"sx_f64_add"(i64 %t3990, i64 %t3999)
  ret i64 %t4000
}

define i64 @"compute_gain_6"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps, i64 %query) nounwind {
entry:
  %local.pi.4001 = alloca i64
  %local.u.4002 = alloca i64
  %local.v.4003 = alloca i64
  %local.w.4004 = alloca i64
  %local.ox.4005 = alloca i64
  %local.oy.4006 = alloca i64
  %local.oz.4007 = alloca i64
  %local.s.4008 = alloca i64
  %local.g_max.4009 = alloca i64
  %local.g_sum.4010 = alloca i64
  %local.g_count.4011 = alloca i64
  %local.prev_e.4012 = alloca i64
  %local.bounded.4013 = alloca i64
  %local.e.4014 = alloca i64
  %local.g.4015 = alloca i64
  %local.n0.4016 = alloca i64
  %local.n1.4017 = alloca i64
  %local.n2.4018 = alloca i64
  %local.n3.4019 = alloca i64
  %local.n4.4020 = alloca i64
  %local.n5.4021 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t4022 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.255)
  store i64 %t4022, ptr %local.pi.4001
  %t4023 = load i64, ptr %local.amp
  %t4024 = load i64, ptr %local.pi.4001
  %t4025 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.256)
  %t4026 = call i64 @"sx_f64_mul"(i64 %t4024, i64 %t4025)
  %t4027 = call i64 @"sin_f64"(i64 %t4026)
  %t4028 = call i64 @"sx_f64_mul"(i64 %t4023, i64 %t4027)
  store i64 %t4028, ptr %local.u.4002
  %t4029 = load i64, ptr %local.amp
  %t4030 = load i64, ptr %local.pi.4001
  %t4031 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.257)
  %t4032 = call i64 @"sx_f64_mul"(i64 %t4030, i64 %t4031)
  %t4033 = call i64 @"sin_f64"(i64 %t4032)
  %t4034 = call i64 @"sx_f64_mul"(i64 %t4029, i64 %t4033)
  store i64 %t4034, ptr %local.v.4003
  %t4035 = load i64, ptr %local.amp
  %t4036 = load i64, ptr %local.pi.4001
  %t4037 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.258)
  %t4038 = call i64 @"sx_f64_mul"(i64 %t4036, i64 %t4037)
  %t4039 = call i64 @"sin_f64"(i64 %t4038)
  %t4040 = call i64 @"sx_f64_mul"(i64 %t4035, i64 %t4039)
  store i64 %t4040, ptr %local.w.4004
  %t4041 = load i64, ptr %local.amp
  %t4042 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.259)
  %t4043 = call i64 @"sx_f64_mul"(i64 %t4041, i64 %t4042)
  %t4044 = load i64, ptr %local.pi.4001
  %t4045 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.260)
  %t4046 = call i64 @"sx_f64_mul"(i64 %t4044, i64 %t4045)
  %t4047 = call i64 @"sin_f64"(i64 %t4046)
  %t4048 = call i64 @"sx_f64_mul"(i64 %t4043, i64 %t4047)
  store i64 %t4048, ptr %local.ox.4005
  %t4049 = load i64, ptr %local.amp
  %t4050 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.261)
  %t4051 = call i64 @"sx_f64_mul"(i64 %t4049, i64 %t4050)
  %t4052 = load i64, ptr %local.pi.4001
  %t4053 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.262)
  %t4054 = call i64 @"sx_f64_mul"(i64 %t4052, i64 %t4053)
  %t4055 = call i64 @"sin_f64"(i64 %t4054)
  %t4056 = call i64 @"sx_f64_mul"(i64 %t4051, i64 %t4055)
  store i64 %t4056, ptr %local.oy.4006
  %t4057 = load i64, ptr %local.amp
  %t4058 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.263)
  %t4059 = call i64 @"sx_f64_mul"(i64 %t4057, i64 %t4058)
  %t4060 = load i64, ptr %local.pi.4001
  %t4061 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.264)
  %t4062 = call i64 @"sx_f64_mul"(i64 %t4060, i64 %t4061)
  %t4063 = call i64 @"sin_f64"(i64 %t4062)
  %t4064 = call i64 @"sx_f64_mul"(i64 %t4059, i64 %t4063)
  store i64 %t4064, ptr %local.oz.4007
  store i64 0, ptr %local.s.4008
  %t4065 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.265)
  store i64 %t4065, ptr %local.g_max.4009
  %t4066 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.266)
  store i64 %t4066, ptr %local.g_sum.4010
  %t4067 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.267)
  store i64 %t4067, ptr %local.g_count.4011
  %t4068 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.268)
  %t4069 = load i64, ptr %local.ox.4005
  %t4070 = load i64, ptr %local.ox.4005
  %t4071 = call i64 @"sx_f64_mul"(i64 %t4069, i64 %t4070)
  %t4072 = load i64, ptr %local.oy.4006
  %t4073 = load i64, ptr %local.oy.4006
  %t4074 = call i64 @"sx_f64_mul"(i64 %t4072, i64 %t4073)
  %t4075 = call i64 @"sx_f64_add"(i64 %t4071, i64 %t4074)
  %t4076 = load i64, ptr %local.oz.4007
  %t4077 = load i64, ptr %local.oz.4007
  %t4078 = call i64 @"sx_f64_mul"(i64 %t4076, i64 %t4077)
  %t4079 = call i64 @"sx_f64_add"(i64 %t4075, i64 %t4078)
  %t4080 = call i64 @"sx_f64_mul"(i64 %t4068, i64 %t4079)
  store i64 %t4080, ptr %local.prev_e.4012
  %t4081 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.269)
  store i64 %t4081, ptr %local.bounded.4013
  br label %loop92
loop92:
  %t4082 = load i64, ptr %local.s.4008
  %t4083 = load i64, ptr %local.max_steps
  %t4084 = icmp slt i64 %t4082, %t4083
  %t4085 = zext i1 %t4084 to i64
  %t4086 = icmp ne i64 %t4085, 0
  br i1 %t4086, label %body92, label %endloop92
body92:
  %t4087 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.270)
  %t4088 = load i64, ptr %local.ox.4005
  %t4089 = load i64, ptr %local.ox.4005
  %t4090 = call i64 @"sx_f64_mul"(i64 %t4088, i64 %t4089)
  %t4091 = load i64, ptr %local.oy.4006
  %t4092 = load i64, ptr %local.oy.4006
  %t4093 = call i64 @"sx_f64_mul"(i64 %t4091, i64 %t4092)
  %t4094 = call i64 @"sx_f64_add"(i64 %t4090, i64 %t4093)
  %t4095 = load i64, ptr %local.oz.4007
  %t4096 = load i64, ptr %local.oz.4007
  %t4097 = call i64 @"sx_f64_mul"(i64 %t4095, i64 %t4096)
  %t4098 = call i64 @"sx_f64_add"(i64 %t4094, i64 %t4097)
  %t4099 = call i64 @"sx_f64_mul"(i64 %t4087, i64 %t4098)
  store i64 %t4099, ptr %local.e.4014
  %t4100 = load i64, ptr %local.e.4014
  %t4101 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.271)
  %t4102 = call i64 @"sx_f64_gt"(i64 %t4100, i64 %t4101)
  %t4103 = icmp ne i64 %t4102, 0
  br i1 %t4103, label %then93, label %else93
then93:
  %t4104 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.272)
  store i64 %t4104, ptr %local.bounded.4013
  %t4105 = load i64, ptr %local.query
  %t4106 = icmp eq i64 %t4105, 0
  %t4107 = zext i1 %t4106 to i64
  %t4108 = icmp ne i64 %t4107, 0
  br i1 %t4108, label %then94, label %else94
then94:
  %t4109 = load i64, ptr %local.g_max.4009
  ret i64 %t4109
else94:
  br label %else94_end
else94_end:
  br label %endif94
endif94:
  %t4110 = phi i64 [ 0, %else94_end ]
  %t4111 = load i64, ptr %local.query
  %t4112 = icmp eq i64 %t4111, 1
  %t4113 = zext i1 %t4112 to i64
  %t4114 = icmp ne i64 %t4113, 0
  br i1 %t4114, label %then95, label %else95
then95:
  %t4115 = load i64, ptr %local.g_count.4011
  %t4116 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.273)
  %t4117 = call i64 @"sx_f64_gt"(i64 %t4115, i64 %t4116)
  %t4118 = icmp ne i64 %t4117, 0
  br i1 %t4118, label %then96, label %else96
then96:
  %t4119 = load i64, ptr %local.g_sum.4010
  %t4120 = load i64, ptr %local.g_count.4011
  %t4121 = call i64 @"sx_f64_div"(i64 %t4119, i64 %t4120)
  ret i64 %t4121
else96:
  br label %else96_end
else96_end:
  br label %endif96
endif96:
  %t4122 = phi i64 [ 0, %else96_end ]
  %t4123 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.274)
  ret i64 %t4123
else95:
  br label %else95_end
else95_end:
  br label %endif95
endif95:
  %t4124 = phi i64 [ 0, %else95_end ]
  %t4125 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.275)
  ret i64 %t4125
else93:
  br label %else93_end
else93_end:
  br label %endif93
endif93:
  %t4126 = phi i64 [ 0, %else93_end ]
  %t4127 = load i64, ptr %local.prev_e.4012
  %t4128 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.276)
  %t4129 = call i64 @"sx_f64_gt"(i64 %t4127, i64 %t4128)
  %t4130 = icmp ne i64 %t4129, 0
  br i1 %t4130, label %then97, label %else97
then97:
  %t4131 = load i64, ptr %local.e.4014
  %t4132 = load i64, ptr %local.prev_e.4012
  %t4133 = call i64 @"sx_f64_sub"(i64 %t4131, i64 %t4132)
  %t4134 = load i64, ptr %local.prev_e.4012
  %t4135 = call i64 @"sx_f64_div"(i64 %t4133, i64 %t4134)
  store i64 %t4135, ptr %local.g.4015
  %t4136 = load i64, ptr %local.g.4015
  %t4137 = load i64, ptr %local.g_max.4009
  %t4138 = call i64 @"sx_f64_gt"(i64 %t4136, i64 %t4137)
  %t4139 = icmp ne i64 %t4138, 0
  br i1 %t4139, label %then98, label %else98
then98:
  %t4140 = load i64, ptr %local.g.4015
  store i64 %t4140, ptr %local.g_max.4009
  br label %then98_end
then98_end:
  br label %endif98
else98:
  br label %else98_end
else98_end:
  br label %endif98
endif98:
  %t4141 = phi i64 [ 0, %then98_end ], [ 0, %else98_end ]
  %t4142 = load i64, ptr %local.g_sum.4010
  %t4143 = load i64, ptr %local.g.4015
  %t4144 = call i64 @"sx_f64_add"(i64 %t4142, i64 %t4143)
  store i64 %t4144, ptr %local.g_sum.4010
  %t4145 = load i64, ptr %local.g_count.4011
  %t4146 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.277)
  %t4147 = call i64 @"sx_f64_add"(i64 %t4145, i64 %t4146)
  store i64 %t4147, ptr %local.g_count.4011
  br label %then97_end
then97_end:
  br label %endif97
else97:
  br label %else97_end
else97_end:
  br label %endif97
endif97:
  %t4148 = phi i64 [ 0, %then97_end ], [ 0, %else97_end ]
  %t4149 = load i64, ptr %local.e.4014
  store i64 %t4149, ptr %local.prev_e.4012
  %t4150 = load i64, ptr %local.u.4002
  %t4151 = load i64, ptr %local.v.4003
  %t4152 = load i64, ptr %local.w.4004
  %t4153 = load i64, ptr %local.ox.4005
  %t4154 = load i64, ptr %local.oy.4006
  %t4155 = load i64, ptr %local.oz.4007
  %t4156 = load i64, ptr %local.nu
  %t4157 = load i64, ptr %local.sigma
  %t4158 = load i64, ptr %local.lambda
  %t4159 = load i64, ptr %local.lambda2
  %t4160 = load i64, ptr %local.dt
  %t4161 = call i64 @"step6"(i64 %t4150, i64 %t4151, i64 %t4152, i64 %t4153, i64 %t4154, i64 %t4155, i64 %t4156, i64 %t4157, i64 %t4158, i64 %t4159, i64 %t4160, i64 0)
  store i64 %t4161, ptr %local.n0.4016
  %t4162 = load i64, ptr %local.u.4002
  %t4163 = load i64, ptr %local.v.4003
  %t4164 = load i64, ptr %local.w.4004
  %t4165 = load i64, ptr %local.ox.4005
  %t4166 = load i64, ptr %local.oy.4006
  %t4167 = load i64, ptr %local.oz.4007
  %t4168 = load i64, ptr %local.nu
  %t4169 = load i64, ptr %local.sigma
  %t4170 = load i64, ptr %local.lambda
  %t4171 = load i64, ptr %local.lambda2
  %t4172 = load i64, ptr %local.dt
  %t4173 = call i64 @"step6"(i64 %t4162, i64 %t4163, i64 %t4164, i64 %t4165, i64 %t4166, i64 %t4167, i64 %t4168, i64 %t4169, i64 %t4170, i64 %t4171, i64 %t4172, i64 1)
  store i64 %t4173, ptr %local.n1.4017
  %t4174 = load i64, ptr %local.u.4002
  %t4175 = load i64, ptr %local.v.4003
  %t4176 = load i64, ptr %local.w.4004
  %t4177 = load i64, ptr %local.ox.4005
  %t4178 = load i64, ptr %local.oy.4006
  %t4179 = load i64, ptr %local.oz.4007
  %t4180 = load i64, ptr %local.nu
  %t4181 = load i64, ptr %local.sigma
  %t4182 = load i64, ptr %local.lambda
  %t4183 = load i64, ptr %local.lambda2
  %t4184 = load i64, ptr %local.dt
  %t4185 = call i64 @"step6"(i64 %t4174, i64 %t4175, i64 %t4176, i64 %t4177, i64 %t4178, i64 %t4179, i64 %t4180, i64 %t4181, i64 %t4182, i64 %t4183, i64 %t4184, i64 2)
  store i64 %t4185, ptr %local.n2.4018
  %t4186 = load i64, ptr %local.u.4002
  %t4187 = load i64, ptr %local.v.4003
  %t4188 = load i64, ptr %local.w.4004
  %t4189 = load i64, ptr %local.ox.4005
  %t4190 = load i64, ptr %local.oy.4006
  %t4191 = load i64, ptr %local.oz.4007
  %t4192 = load i64, ptr %local.nu
  %t4193 = load i64, ptr %local.sigma
  %t4194 = load i64, ptr %local.lambda
  %t4195 = load i64, ptr %local.lambda2
  %t4196 = load i64, ptr %local.dt
  %t4197 = call i64 @"step6"(i64 %t4186, i64 %t4187, i64 %t4188, i64 %t4189, i64 %t4190, i64 %t4191, i64 %t4192, i64 %t4193, i64 %t4194, i64 %t4195, i64 %t4196, i64 3)
  store i64 %t4197, ptr %local.n3.4019
  %t4198 = load i64, ptr %local.u.4002
  %t4199 = load i64, ptr %local.v.4003
  %t4200 = load i64, ptr %local.w.4004
  %t4201 = load i64, ptr %local.ox.4005
  %t4202 = load i64, ptr %local.oy.4006
  %t4203 = load i64, ptr %local.oz.4007
  %t4204 = load i64, ptr %local.nu
  %t4205 = load i64, ptr %local.sigma
  %t4206 = load i64, ptr %local.lambda
  %t4207 = load i64, ptr %local.lambda2
  %t4208 = load i64, ptr %local.dt
  %t4209 = call i64 @"step6"(i64 %t4198, i64 %t4199, i64 %t4200, i64 %t4201, i64 %t4202, i64 %t4203, i64 %t4204, i64 %t4205, i64 %t4206, i64 %t4207, i64 %t4208, i64 4)
  store i64 %t4209, ptr %local.n4.4020
  %t4210 = load i64, ptr %local.u.4002
  %t4211 = load i64, ptr %local.v.4003
  %t4212 = load i64, ptr %local.w.4004
  %t4213 = load i64, ptr %local.ox.4005
  %t4214 = load i64, ptr %local.oy.4006
  %t4215 = load i64, ptr %local.oz.4007
  %t4216 = load i64, ptr %local.nu
  %t4217 = load i64, ptr %local.sigma
  %t4218 = load i64, ptr %local.lambda
  %t4219 = load i64, ptr %local.lambda2
  %t4220 = load i64, ptr %local.dt
  %t4221 = call i64 @"step6"(i64 %t4210, i64 %t4211, i64 %t4212, i64 %t4213, i64 %t4214, i64 %t4215, i64 %t4216, i64 %t4217, i64 %t4218, i64 %t4219, i64 %t4220, i64 5)
  store i64 %t4221, ptr %local.n5.4021
  %t4222 = load i64, ptr %local.n0.4016
  store i64 %t4222, ptr %local.u.4002
  %t4223 = load i64, ptr %local.n1.4017
  store i64 %t4223, ptr %local.v.4003
  %t4224 = load i64, ptr %local.n2.4018
  store i64 %t4224, ptr %local.w.4004
  %t4225 = load i64, ptr %local.n3.4019
  store i64 %t4225, ptr %local.ox.4005
  %t4226 = load i64, ptr %local.n4.4020
  store i64 %t4226, ptr %local.oy.4006
  %t4227 = load i64, ptr %local.n5.4021
  store i64 %t4227, ptr %local.oz.4007
  %t4228 = load i64, ptr %local.s.4008
  %t4229 = add i64 %t4228, 1
  store i64 %t4229, ptr %local.s.4008
  br label %loop92
endloop92:
  %t4230 = load i64, ptr %local.query
  %t4231 = icmp eq i64 %t4230, 0
  %t4232 = zext i1 %t4231 to i64
  %t4233 = icmp ne i64 %t4232, 0
  br i1 %t4233, label %then99, label %else99
then99:
  %t4234 = load i64, ptr %local.g_max.4009
  ret i64 %t4234
else99:
  br label %else99_end
else99_end:
  br label %endif99
endif99:
  %t4235 = phi i64 [ 0, %else99_end ]
  %t4236 = load i64, ptr %local.query
  %t4237 = icmp eq i64 %t4236, 1
  %t4238 = zext i1 %t4237 to i64
  %t4239 = icmp ne i64 %t4238, 0
  br i1 %t4239, label %then100, label %else100
then100:
  %t4240 = load i64, ptr %local.g_count.4011
  %t4241 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.278)
  %t4242 = call i64 @"sx_f64_gt"(i64 %t4240, i64 %t4241)
  %t4243 = icmp ne i64 %t4242, 0
  br i1 %t4243, label %then101, label %else101
then101:
  %t4244 = load i64, ptr %local.g_sum.4010
  %t4245 = load i64, ptr %local.g_count.4011
  %t4246 = call i64 @"sx_f64_div"(i64 %t4244, i64 %t4245)
  ret i64 %t4246
else101:
  br label %else101_end
else101_end:
  br label %endif101
endif101:
  %t4247 = phi i64 [ 0, %else101_end ]
  %t4248 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.279)
  ret i64 %t4248
else100:
  br label %else100_end
else100_end:
  br label %endif100
endif100:
  %t4249 = phi i64 [ 0, %else100_end ]
  %t4250 = load i64, ptr %local.bounded.4013
  ret i64 %t4250
}

define i64 @"nu_eff"(i64 %nu, i64 %n) nounwind {
entry:
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t4251 = load i64, ptr %local.nu
  %t4252 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.280)
  %t4253 = load i64, ptr %local.n
  %t4254 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.281)
  %t4255 = call i64 @"sx_f64_sub"(i64 %t4253, i64 %t4254)
  %t4256 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.282)
  %t4257 = call i64 @"sx_f64_div"(i64 %t4255, i64 %t4256)
  %t4258 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.283)
  %t4259 = call i64 @"sx_f64_mul"(i64 %t4257, i64 %t4258)
  %t4260 = call i64 @"sx_f64_add"(i64 %t4252, i64 %t4259)
  %t4261 = call i64 @"sx_f64_mul"(i64 %t4251, i64 %t4260)
  ret i64 %t4261
}

define i64 @"sigma_eff"(i64 %sigma, i64 %n) nounwind {
entry:
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t4262 = load i64, ptr %local.sigma
  %t4263 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.284)
  %t4264 = load i64, ptr %local.n
  %t4265 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.285)
  %t4266 = call i64 @"sx_f64_sub"(i64 %t4264, i64 %t4265)
  %t4267 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.286)
  %t4268 = call i64 @"sx_f64_div"(i64 %t4266, i64 %t4267)
  %t4269 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.287)
  %t4270 = call i64 @"sx_f64_mul"(i64 %t4268, i64 %t4269)
  %t4271 = call i64 @"sx_f64_add"(i64 %t4263, i64 %t4270)
  %t4272 = call i64 @"sx_f64_mul"(i64 %t4262, i64 %t4271)
  ret i64 %t4272
}

define i64 @"fit_separable"(i64 %g_data, i64 %a_val, i64 %n_val, i64 %sa4, i64 %sa2n, i64 %sn2, i64 %sga2, i64 %sgn, i64 %count, i64 %query) nounwind {
entry:
  %local.det.4273 = alloca i64
  %local.a.4274 = alloca i64
  %local.b.4275 = alloca i64
  %local.pred.4276 = alloca i64
  %local.res.4277 = alloca i64
  %local.g_data = alloca i64
  store i64 %g_data, ptr %local.g_data
  %local.a_val = alloca i64
  store i64 %a_val, ptr %local.a_val
  %local.n_val = alloca i64
  store i64 %n_val, ptr %local.n_val
  %local.sa4 = alloca i64
  store i64 %sa4, ptr %local.sa4
  %local.sa2n = alloca i64
  store i64 %sa2n, ptr %local.sa2n
  %local.sn2 = alloca i64
  store i64 %sn2, ptr %local.sn2
  %local.sga2 = alloca i64
  store i64 %sga2, ptr %local.sga2
  %local.sgn = alloca i64
  store i64 %sgn, ptr %local.sgn
  %local.count = alloca i64
  store i64 %count, ptr %local.count
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t4278 = load i64, ptr %local.sa4
  %t4279 = load i64, ptr %local.sn2
  %t4280 = call i64 @"sx_f64_mul"(i64 %t4278, i64 %t4279)
  %t4281 = load i64, ptr %local.sa2n
  %t4282 = load i64, ptr %local.sa2n
  %t4283 = call i64 @"sx_f64_mul"(i64 %t4281, i64 %t4282)
  %t4284 = call i64 @"sx_f64_sub"(i64 %t4280, i64 %t4283)
  store i64 %t4284, ptr %local.det.4273
  %t4285 = load i64, ptr %local.det.4273
  %t4286 = call i64 @"abs_f64"(i64 %t4285)
  %t4287 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.288)
  %t4288 = call i64 @"sx_f64_lt"(i64 %t4286, i64 %t4287)
  %t4289 = icmp ne i64 %t4288, 0
  br i1 %t4289, label %then102, label %else102
then102:
  %t4290 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.289)
  ret i64 %t4290
else102:
  br label %else102_end
else102_end:
  br label %endif102
endif102:
  %t4291 = phi i64 [ 0, %else102_end ]
  %t4292 = load i64, ptr %local.sga2
  %t4293 = load i64, ptr %local.sn2
  %t4294 = call i64 @"sx_f64_mul"(i64 %t4292, i64 %t4293)
  %t4295 = load i64, ptr %local.sgn
  %t4296 = load i64, ptr %local.sa2n
  %t4297 = call i64 @"sx_f64_mul"(i64 %t4295, i64 %t4296)
  %t4298 = call i64 @"sx_f64_sub"(i64 %t4294, i64 %t4297)
  %t4299 = load i64, ptr %local.det.4273
  %t4300 = call i64 @"sx_f64_div"(i64 %t4298, i64 %t4299)
  store i64 %t4300, ptr %local.a.4274
  %t4301 = load i64, ptr %local.sgn
  %t4302 = load i64, ptr %local.sa4
  %t4303 = call i64 @"sx_f64_mul"(i64 %t4301, i64 %t4302)
  %t4304 = load i64, ptr %local.sga2
  %t4305 = load i64, ptr %local.sa2n
  %t4306 = call i64 @"sx_f64_mul"(i64 %t4304, i64 %t4305)
  %t4307 = call i64 @"sx_f64_sub"(i64 %t4303, i64 %t4306)
  %t4308 = load i64, ptr %local.det.4273
  %t4309 = call i64 @"sx_f64_div"(i64 %t4307, i64 %t4308)
  store i64 %t4309, ptr %local.b.4275
  %t4310 = load i64, ptr %local.query
  %t4311 = icmp eq i64 %t4310, 0
  %t4312 = zext i1 %t4311 to i64
  %t4313 = icmp ne i64 %t4312, 0
  br i1 %t4313, label %then103, label %else103
then103:
  %t4314 = load i64, ptr %local.a.4274
  ret i64 %t4314
else103:
  br label %else103_end
else103_end:
  br label %endif103
endif103:
  %t4315 = phi i64 [ 0, %else103_end ]
  %t4316 = load i64, ptr %local.query
  %t4317 = icmp eq i64 %t4316, 1
  %t4318 = zext i1 %t4317 to i64
  %t4319 = icmp ne i64 %t4318, 0
  br i1 %t4319, label %then104, label %else104
then104:
  %t4320 = load i64, ptr %local.b.4275
  ret i64 %t4320
else104:
  br label %else104_end
else104_end:
  br label %endif104
endif104:
  %t4321 = phi i64 [ 0, %else104_end ]
  %t4322 = load i64, ptr %local.a.4274
  %t4323 = load i64, ptr %local.a_val
  %t4324 = call i64 @"sx_f64_mul"(i64 %t4322, i64 %t4323)
  %t4325 = load i64, ptr %local.a_val
  %t4326 = call i64 @"sx_f64_mul"(i64 %t4324, i64 %t4325)
  %t4327 = load i64, ptr %local.b.4275
  %t4328 = load i64, ptr %local.n_val
  %t4329 = call i64 @"sx_f64_div"(i64 %t4327, i64 %t4328)
  %t4330 = call i64 @"sx_f64_add"(i64 %t4326, i64 %t4329)
  store i64 %t4330, ptr %local.pred.4276
  %t4331 = load i64, ptr %local.g_data
  %t4332 = load i64, ptr %local.pred.4276
  %t4333 = call i64 @"sx_f64_sub"(i64 %t4331, i64 %t4332)
  %t4334 = load i64, ptr %local.g_data
  %t4335 = load i64, ptr %local.pred.4276
  %t4336 = call i64 @"sx_f64_sub"(i64 %t4334, i64 %t4335)
  %t4337 = call i64 @"sx_f64_mul"(i64 %t4333, i64 %t4336)
  store i64 %t4337, ptr %local.res.4277
  %t4338 = load i64, ptr %local.res.4277
  ret i64 %t4338
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.4339 = alloca i64
  %local.sigma.4340 = alloca i64
  %local.lambda.4341 = alloca i64
  %local.lambda2.4342 = alloca i64
  %local.dt.4343 = alloca i64
  %local.max_s.4344 = alloca i64
  %local.sum_a4.4345 = alloca i64
  %local.sum_a2n.4346 = alloca i64
  %local.sum_n2.4347 = alloca i64
  %local.sum_ga2.4348 = alloca i64
  %local.sum_gn.4349 = alloca i64
  %local.fit_count.4350 = alloca i64
  %local.sum_a4_m.4351 = alloca i64
  %local.sum_a2cn.4352 = alloca i64
  %local.sum_ga2_m.4353 = alloca i64
  %local.ni.4354 = alloca i64
  %local.n_val.4355 = alloca i64
  %local.nu_e.4356 = alloca i64
  %local.sigma_e.4357 = alloca i64
  %local.ai.4358 = alloca i64
  %local.a_val.4359 = alloca i64
  %local.g_max.4360 = alloca i64
  %local.g_avg.4361 = alloca i64
  %local.bnd.4362 = alloca i64
  %local.a2.4363 = alloca i64
  %local.inv_n.4364 = alloca i64
  %local.y.4365 = alloca i64
  %local.det1.4366 = alloca i64
  %local.a_sep.4367 = alloca i64
  %local.b_sep.4368 = alloca i64
  %local.n_pts.4369 = alloca i64
  %local.mean_x.4370 = alloca i64
  %local.mean_y.4371 = alloca i64
  %local.a_mult.4372 = alloca i64
  %local.c_mult.4373 = alloca i64
  %t4374 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.290)
  %t4375 = ptrtoint ptr %t4374 to i64
  %t4376 = inttoptr i64 %t4375 to ptr
  call void @intrinsic_println(ptr %t4376)
  %t4377 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.291)
  %t4378 = ptrtoint ptr %t4377 to i64
  %t4379 = inttoptr i64 %t4378 to ptr
  call void @intrinsic_println(ptr %t4379)
  %t4380 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.292)
  %t4381 = ptrtoint ptr %t4380 to i64
  %t4382 = inttoptr i64 %t4381 to ptr
  call void @intrinsic_println(ptr %t4382)
  %t4383 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.293)
  %t4384 = ptrtoint ptr %t4383 to i64
  %t4385 = inttoptr i64 %t4384 to ptr
  call void @intrinsic_println(ptr %t4385)
  %t4386 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.294)
  %t4387 = ptrtoint ptr %t4386 to i64
  %t4388 = inttoptr i64 %t4387 to ptr
  call void @intrinsic_println(ptr %t4388)
  %t4389 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.295)
  %t4390 = ptrtoint ptr %t4389 to i64
  %t4391 = inttoptr i64 %t4390 to ptr
  call void @intrinsic_println(ptr %t4391)
  %t4392 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.296)
  %t4393 = ptrtoint ptr %t4392 to i64
  %t4394 = inttoptr i64 %t4393 to ptr
  call void @intrinsic_println(ptr %t4394)
  %t4395 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.297)
  %t4396 = ptrtoint ptr %t4395 to i64
  %t4397 = inttoptr i64 %t4396 to ptr
  call void @intrinsic_println(ptr %t4397)
  %t4398 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.298)
  store i64 %t4398, ptr %local.nu.4339
  %t4399 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.299)
  store i64 %t4399, ptr %local.sigma.4340
  %t4400 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.300)
  store i64 %t4400, ptr %local.lambda.4341
  %t4401 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.301)
  store i64 %t4401, ptr %local.lambda2.4342
  %t4402 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.302)
  store i64 %t4402, ptr %local.dt.4343
  store i64 50000, ptr %local.max_s.4344
  %t4403 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.303)
  %t4404 = ptrtoint ptr %t4403 to i64
  %t4405 = inttoptr i64 %t4404 to ptr
  call void @intrinsic_println(ptr %t4405)
  %t4406 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.304)
  %t4407 = ptrtoint ptr %t4406 to i64
  %t4408 = inttoptr i64 %t4407 to ptr
  call void @intrinsic_println(ptr %t4408)
  %t4409 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.305)
  %t4410 = ptrtoint ptr %t4409 to i64
  %t4411 = inttoptr i64 %t4410 to ptr
  call void @intrinsic_println(ptr %t4411)
  %t4412 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.306)
  %t4413 = ptrtoint ptr %t4412 to i64
  %t4414 = inttoptr i64 %t4413 to ptr
  call void @intrinsic_println(ptr %t4414)
  %t4415 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.307)
  store i64 %t4415, ptr %local.sum_a4.4345
  %t4416 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.308)
  store i64 %t4416, ptr %local.sum_a2n.4346
  %t4417 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.309)
  store i64 %t4417, ptr %local.sum_n2.4347
  %t4418 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.310)
  store i64 %t4418, ptr %local.sum_ga2.4348
  %t4419 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.311)
  store i64 %t4419, ptr %local.sum_gn.4349
  %t4420 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.312)
  store i64 %t4420, ptr %local.fit_count.4350
  %t4421 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.313)
  store i64 %t4421, ptr %local.sum_a4_m.4351
  %t4422 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.314)
  store i64 %t4422, ptr %local.sum_a2cn.4352
  %t4423 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.315)
  store i64 %t4423, ptr %local.sum_ga2_m.4353
  store i64 0, ptr %local.ni.4354
  br label %loop105
loop105:
  %t4424 = load i64, ptr %local.ni.4354
  %t4425 = icmp slt i64 %t4424, 7
  %t4426 = zext i1 %t4425 to i64
  %t4427 = icmp ne i64 %t4426, 0
  br i1 %t4427, label %body105, label %endloop105
body105:
  %t4428 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.316)
  store i64 %t4428, ptr %local.n_val.4355
  %t4429 = load i64, ptr %local.ni.4354
  %t4430 = icmp eq i64 %t4429, 1
  %t4431 = zext i1 %t4430 to i64
  %t4432 = icmp ne i64 %t4431, 0
  br i1 %t4432, label %then106, label %else106
then106:
  %t4433 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.317)
  store i64 %t4433, ptr %local.n_val.4355
  br label %then106_end
then106_end:
  br label %endif106
else106:
  br label %else106_end
else106_end:
  br label %endif106
endif106:
  %t4434 = phi i64 [ 0, %then106_end ], [ 0, %else106_end ]
  %t4435 = load i64, ptr %local.ni.4354
  %t4436 = icmp eq i64 %t4435, 2
  %t4437 = zext i1 %t4436 to i64
  %t4438 = icmp ne i64 %t4437, 0
  br i1 %t4438, label %then107, label %else107
then107:
  %t4439 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.318)
  store i64 %t4439, ptr %local.n_val.4355
  br label %then107_end
then107_end:
  br label %endif107
else107:
  br label %else107_end
else107_end:
  br label %endif107
endif107:
  %t4440 = phi i64 [ 0, %then107_end ], [ 0, %else107_end ]
  %t4441 = load i64, ptr %local.ni.4354
  %t4442 = icmp eq i64 %t4441, 3
  %t4443 = zext i1 %t4442 to i64
  %t4444 = icmp ne i64 %t4443, 0
  br i1 %t4444, label %then108, label %else108
then108:
  %t4445 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.319)
  store i64 %t4445, ptr %local.n_val.4355
  br label %then108_end
then108_end:
  br label %endif108
else108:
  br label %else108_end
else108_end:
  br label %endif108
endif108:
  %t4446 = phi i64 [ 0, %then108_end ], [ 0, %else108_end ]
  %t4447 = load i64, ptr %local.ni.4354
  %t4448 = icmp eq i64 %t4447, 4
  %t4449 = zext i1 %t4448 to i64
  %t4450 = icmp ne i64 %t4449, 0
  br i1 %t4450, label %then109, label %else109
then109:
  %t4451 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.320)
  store i64 %t4451, ptr %local.n_val.4355
  br label %then109_end
then109_end:
  br label %endif109
else109:
  br label %else109_end
else109_end:
  br label %endif109
endif109:
  %t4452 = phi i64 [ 0, %then109_end ], [ 0, %else109_end ]
  %t4453 = load i64, ptr %local.ni.4354
  %t4454 = icmp eq i64 %t4453, 5
  %t4455 = zext i1 %t4454 to i64
  %t4456 = icmp ne i64 %t4455, 0
  br i1 %t4456, label %then110, label %else110
then110:
  %t4457 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.321)
  store i64 %t4457, ptr %local.n_val.4355
  br label %then110_end
then110_end:
  br label %endif110
else110:
  br label %else110_end
else110_end:
  br label %endif110
endif110:
  %t4458 = phi i64 [ 0, %then110_end ], [ 0, %else110_end ]
  %t4459 = load i64, ptr %local.ni.4354
  %t4460 = icmp eq i64 %t4459, 6
  %t4461 = zext i1 %t4460 to i64
  %t4462 = icmp ne i64 %t4461, 0
  br i1 %t4462, label %then111, label %else111
then111:
  %t4463 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.322)
  store i64 %t4463, ptr %local.n_val.4355
  br label %then111_end
then111_end:
  br label %endif111
else111:
  br label %else111_end
else111_end:
  br label %endif111
endif111:
  %t4464 = phi i64 [ 0, %then111_end ], [ 0, %else111_end ]
  %t4465 = load i64, ptr %local.nu.4339
  %t4466 = load i64, ptr %local.n_val.4355
  %t4467 = call i64 @"nu_eff"(i64 %t4465, i64 %t4466)
  store i64 %t4467, ptr %local.nu_e.4356
  %t4468 = load i64, ptr %local.sigma.4340
  %t4469 = load i64, ptr %local.n_val.4355
  %t4470 = call i64 @"sigma_eff"(i64 %t4468, i64 %t4469)
  store i64 %t4470, ptr %local.sigma_e.4357
  store i64 0, ptr %local.ai.4358
  br label %loop112
loop112:
  %t4471 = load i64, ptr %local.ai.4358
  %t4472 = icmp slt i64 %t4471, 10
  %t4473 = zext i1 %t4472 to i64
  %t4474 = icmp ne i64 %t4473, 0
  br i1 %t4474, label %body112, label %endloop112
body112:
  %t4475 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.323)
  store i64 %t4475, ptr %local.a_val.4359
  %t4476 = load i64, ptr %local.ai.4358
  %t4477 = icmp eq i64 %t4476, 1
  %t4478 = zext i1 %t4477 to i64
  %t4479 = icmp ne i64 %t4478, 0
  br i1 %t4479, label %then113, label %else113
then113:
  %t4480 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.324)
  store i64 %t4480, ptr %local.a_val.4359
  br label %then113_end
then113_end:
  br label %endif113
else113:
  br label %else113_end
else113_end:
  br label %endif113
endif113:
  %t4481 = phi i64 [ 0, %then113_end ], [ 0, %else113_end ]
  %t4482 = load i64, ptr %local.ai.4358
  %t4483 = icmp eq i64 %t4482, 2
  %t4484 = zext i1 %t4483 to i64
  %t4485 = icmp ne i64 %t4484, 0
  br i1 %t4485, label %then114, label %else114
then114:
  %t4486 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.325)
  store i64 %t4486, ptr %local.a_val.4359
  br label %then114_end
then114_end:
  br label %endif114
else114:
  br label %else114_end
else114_end:
  br label %endif114
endif114:
  %t4487 = phi i64 [ 0, %then114_end ], [ 0, %else114_end ]
  %t4488 = load i64, ptr %local.ai.4358
  %t4489 = icmp eq i64 %t4488, 3
  %t4490 = zext i1 %t4489 to i64
  %t4491 = icmp ne i64 %t4490, 0
  br i1 %t4491, label %then115, label %else115
then115:
  %t4492 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.326)
  store i64 %t4492, ptr %local.a_val.4359
  br label %then115_end
then115_end:
  br label %endif115
else115:
  br label %else115_end
else115_end:
  br label %endif115
endif115:
  %t4493 = phi i64 [ 0, %then115_end ], [ 0, %else115_end ]
  %t4494 = load i64, ptr %local.ai.4358
  %t4495 = icmp eq i64 %t4494, 4
  %t4496 = zext i1 %t4495 to i64
  %t4497 = icmp ne i64 %t4496, 0
  br i1 %t4497, label %then116, label %else116
then116:
  %t4498 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.327)
  store i64 %t4498, ptr %local.a_val.4359
  br label %then116_end
then116_end:
  br label %endif116
else116:
  br label %else116_end
else116_end:
  br label %endif116
endif116:
  %t4499 = phi i64 [ 0, %then116_end ], [ 0, %else116_end ]
  %t4500 = load i64, ptr %local.ai.4358
  %t4501 = icmp eq i64 %t4500, 5
  %t4502 = zext i1 %t4501 to i64
  %t4503 = icmp ne i64 %t4502, 0
  br i1 %t4503, label %then117, label %else117
then117:
  %t4504 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.328)
  store i64 %t4504, ptr %local.a_val.4359
  br label %then117_end
then117_end:
  br label %endif117
else117:
  br label %else117_end
else117_end:
  br label %endif117
endif117:
  %t4505 = phi i64 [ 0, %then117_end ], [ 0, %else117_end ]
  %t4506 = load i64, ptr %local.ai.4358
  %t4507 = icmp eq i64 %t4506, 6
  %t4508 = zext i1 %t4507 to i64
  %t4509 = icmp ne i64 %t4508, 0
  br i1 %t4509, label %then118, label %else118
then118:
  %t4510 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.329)
  store i64 %t4510, ptr %local.a_val.4359
  br label %then118_end
then118_end:
  br label %endif118
else118:
  br label %else118_end
else118_end:
  br label %endif118
endif118:
  %t4511 = phi i64 [ 0, %then118_end ], [ 0, %else118_end ]
  %t4512 = load i64, ptr %local.ai.4358
  %t4513 = icmp eq i64 %t4512, 7
  %t4514 = zext i1 %t4513 to i64
  %t4515 = icmp ne i64 %t4514, 0
  br i1 %t4515, label %then119, label %else119
then119:
  %t4516 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.330)
  store i64 %t4516, ptr %local.a_val.4359
  br label %then119_end
then119_end:
  br label %endif119
else119:
  br label %else119_end
else119_end:
  br label %endif119
endif119:
  %t4517 = phi i64 [ 0, %then119_end ], [ 0, %else119_end ]
  %t4518 = load i64, ptr %local.ai.4358
  %t4519 = icmp eq i64 %t4518, 8
  %t4520 = zext i1 %t4519 to i64
  %t4521 = icmp ne i64 %t4520, 0
  br i1 %t4521, label %then120, label %else120
then120:
  %t4522 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.331)
  store i64 %t4522, ptr %local.a_val.4359
  br label %then120_end
then120_end:
  br label %endif120
else120:
  br label %else120_end
else120_end:
  br label %endif120
endif120:
  %t4523 = phi i64 [ 0, %then120_end ], [ 0, %else120_end ]
  %t4524 = load i64, ptr %local.ai.4358
  %t4525 = icmp eq i64 %t4524, 9
  %t4526 = zext i1 %t4525 to i64
  %t4527 = icmp ne i64 %t4526, 0
  br i1 %t4527, label %then121, label %else121
then121:
  %t4528 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.332)
  store i64 %t4528, ptr %local.a_val.4359
  br label %then121_end
then121_end:
  br label %endif121
else121:
  br label %else121_end
else121_end:
  br label %endif121
endif121:
  %t4529 = phi i64 [ 0, %then121_end ], [ 0, %else121_end ]
  %t4530 = load i64, ptr %local.a_val.4359
  %t4531 = load i64, ptr %local.nu_e.4356
  %t4532 = load i64, ptr %local.sigma_e.4357
  %t4533 = load i64, ptr %local.lambda.4341
  %t4534 = load i64, ptr %local.lambda2.4342
  %t4535 = load i64, ptr %local.dt.4343
  %t4536 = load i64, ptr %local.max_s.4344
  %t4537 = call i64 @"compute_gain_6"(i64 %t4530, i64 %t4531, i64 %t4532, i64 %t4533, i64 %t4534, i64 %t4535, i64 %t4536, i64 0)
  store i64 %t4537, ptr %local.g_max.4360
  %t4538 = load i64, ptr %local.a_val.4359
  %t4539 = load i64, ptr %local.nu_e.4356
  %t4540 = load i64, ptr %local.sigma_e.4357
  %t4541 = load i64, ptr %local.lambda.4341
  %t4542 = load i64, ptr %local.lambda2.4342
  %t4543 = load i64, ptr %local.dt.4343
  %t4544 = load i64, ptr %local.max_s.4344
  %t4545 = call i64 @"compute_gain_6"(i64 %t4538, i64 %t4539, i64 %t4540, i64 %t4541, i64 %t4542, i64 %t4543, i64 %t4544, i64 1)
  store i64 %t4545, ptr %local.g_avg.4361
  %t4546 = load i64, ptr %local.a_val.4359
  %t4547 = load i64, ptr %local.nu_e.4356
  %t4548 = load i64, ptr %local.sigma_e.4357
  %t4549 = load i64, ptr %local.lambda.4341
  %t4550 = load i64, ptr %local.lambda2.4342
  %t4551 = load i64, ptr %local.dt.4343
  %t4552 = load i64, ptr %local.max_s.4344
  %t4553 = call i64 @"compute_gain_6"(i64 %t4546, i64 %t4547, i64 %t4548, i64 %t4549, i64 %t4550, i64 %t4551, i64 %t4552, i64 2)
  store i64 %t4553, ptr %local.bnd.4362
  %t4554 = load i64, ptr %local.a_val.4359
  %t4555 = load i64, ptr %local.a_val.4359
  %t4556 = call i64 @"sx_f64_mul"(i64 %t4554, i64 %t4555)
  store i64 %t4556, ptr %local.a2.4363
  %t4557 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.333)
  %t4558 = load i64, ptr %local.n_val.4355
  %t4559 = call i64 @"sx_f64_div"(i64 %t4557, i64 %t4558)
  store i64 %t4559, ptr %local.inv_n.4364
  %t4560 = load i64, ptr %local.sum_a4.4345
  %t4561 = load i64, ptr %local.a2.4363
  %t4562 = load i64, ptr %local.a2.4363
  %t4563 = call i64 @"sx_f64_mul"(i64 %t4561, i64 %t4562)
  %t4564 = call i64 @"sx_f64_add"(i64 %t4560, i64 %t4563)
  store i64 %t4564, ptr %local.sum_a4.4345
  %t4565 = load i64, ptr %local.sum_a2n.4346
  %t4566 = load i64, ptr %local.a2.4363
  %t4567 = load i64, ptr %local.inv_n.4364
  %t4568 = call i64 @"sx_f64_mul"(i64 %t4566, i64 %t4567)
  %t4569 = call i64 @"sx_f64_add"(i64 %t4565, i64 %t4568)
  store i64 %t4569, ptr %local.sum_a2n.4346
  %t4570 = load i64, ptr %local.sum_n2.4347
  %t4571 = load i64, ptr %local.inv_n.4364
  %t4572 = load i64, ptr %local.inv_n.4364
  %t4573 = call i64 @"sx_f64_mul"(i64 %t4571, i64 %t4572)
  %t4574 = call i64 @"sx_f64_add"(i64 %t4570, i64 %t4573)
  store i64 %t4574, ptr %local.sum_n2.4347
  %t4575 = load i64, ptr %local.sum_ga2.4348
  %t4576 = load i64, ptr %local.g_max.4360
  %t4577 = load i64, ptr %local.a2.4363
  %t4578 = call i64 @"sx_f64_mul"(i64 %t4576, i64 %t4577)
  %t4579 = call i64 @"sx_f64_add"(i64 %t4575, i64 %t4578)
  store i64 %t4579, ptr %local.sum_ga2.4348
  %t4580 = load i64, ptr %local.sum_gn.4349
  %t4581 = load i64, ptr %local.g_max.4360
  %t4582 = load i64, ptr %local.inv_n.4364
  %t4583 = call i64 @"sx_f64_mul"(i64 %t4581, i64 %t4582)
  %t4584 = call i64 @"sx_f64_add"(i64 %t4580, i64 %t4583)
  store i64 %t4584, ptr %local.sum_gn.4349
  %t4585 = load i64, ptr %local.fit_count.4350
  %t4586 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.334)
  %t4587 = call i64 @"sx_f64_add"(i64 %t4585, i64 %t4586)
  store i64 %t4587, ptr %local.fit_count.4350
  %t4588 = load i64, ptr %local.sum_a4_m.4351
  %t4589 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.335)
  %t4590 = call i64 @"sx_f64_add"(i64 %t4588, i64 %t4589)
  store i64 %t4590, ptr %local.sum_a4_m.4351
  %t4591 = load i64, ptr %local.a2.4363
  %t4592 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.336)
  %t4593 = call i64 @"sx_f64_gt"(i64 %t4591, i64 %t4592)
  %t4594 = icmp ne i64 %t4593, 0
  br i1 %t4594, label %then122, label %else122
then122:
  %t4595 = load i64, ptr %local.g_max.4360
  %t4596 = load i64, ptr %local.a2.4363
  %t4597 = call i64 @"sx_f64_div"(i64 %t4595, i64 %t4596)
  store i64 %t4597, ptr %local.y.4365
  %t4598 = load i64, ptr %local.sum_a2cn.4352
  %t4599 = load i64, ptr %local.inv_n.4364
  %t4600 = call i64 @"sx_f64_add"(i64 %t4598, i64 %t4599)
  store i64 %t4600, ptr %local.sum_a2cn.4352
  %t4601 = load i64, ptr %local.sum_ga2_m.4353
  %t4602 = load i64, ptr %local.y.4365
  %t4603 = call i64 @"sx_f64_add"(i64 %t4601, i64 %t4602)
  store i64 %t4603, ptr %local.sum_ga2_m.4353
  br label %then122_end
then122_end:
  br label %endif122
else122:
  br label %else122_end
else122_end:
  br label %endif122
endif122:
  %t4604 = phi i64 [ 0, %then122_end ], [ 0, %else122_end ]
  %t4605 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.337)
  %t4606 = ptrtoint ptr %t4605 to i64
  %t4607 = inttoptr i64 %t4606 to ptr
  call void @intrinsic_print(ptr %t4607)
  %t4608 = load i64, ptr %local.n_val.4355
  %t4609 = call i64 @"sx_f64_to_int"(i64 %t4608)
  call void @print_i64(i64 %t4609)
  %t4610 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.338)
  %t4611 = ptrtoint ptr %t4610 to i64
  %t4612 = inttoptr i64 %t4611 to ptr
  call void @intrinsic_print(ptr %t4612)
  %t4613 = load i64, ptr %local.a_val.4359
  %t4614 = call i64 @"print_f64"(i64 %t4613)
  %t4615 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.339)
  %t4616 = ptrtoint ptr %t4615 to i64
  %t4617 = inttoptr i64 %t4616 to ptr
  call void @intrinsic_print(ptr %t4617)
  %t4618 = load i64, ptr %local.g_max.4360
  %t4619 = call i64 @"print_f64"(i64 %t4618)
  %t4620 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.340)
  %t4621 = ptrtoint ptr %t4620 to i64
  %t4622 = inttoptr i64 %t4621 to ptr
  call void @intrinsic_print(ptr %t4622)
  %t4623 = load i64, ptr %local.g_avg.4361
  %t4624 = call i64 @"print_f64"(i64 %t4623)
  %t4625 = load i64, ptr %local.bnd.4362
  %t4626 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.341)
  %t4627 = call i64 @"sx_f64_gt"(i64 %t4625, i64 %t4626)
  %t4628 = icmp ne i64 %t4627, 0
  br i1 %t4628, label %then123, label %else123
then123:
  %t4629 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.342)
  %t4630 = ptrtoint ptr %t4629 to i64
  %t4631 = inttoptr i64 %t4630 to ptr
  call void @intrinsic_println(ptr %t4631)
  br label %then123_end
then123_end:
  br label %endif123
else123:
  %t4632 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.343)
  %t4633 = ptrtoint ptr %t4632 to i64
  %t4634 = inttoptr i64 %t4633 to ptr
  call void @intrinsic_println(ptr %t4634)
  br label %else123_end
else123_end:
  br label %endif123
endif123:
  %t4635 = phi i64 [ 0, %then123_end ], [ 0, %else123_end ]
  %t4636 = load i64, ptr %local.ai.4358
  %t4637 = add i64 %t4636, 1
  store i64 %t4637, ptr %local.ai.4358
  br label %loop112
endloop112:
  %t4638 = load i64, ptr %local.ni.4354
  %t4639 = add i64 %t4638, 1
  store i64 %t4639, ptr %local.ni.4354
  br label %loop105
endloop105:
  %t4640 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.344)
  %t4641 = ptrtoint ptr %t4640 to i64
  %t4642 = inttoptr i64 %t4641 to ptr
  call void @intrinsic_println(ptr %t4642)
  %t4643 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.345)
  %t4644 = ptrtoint ptr %t4643 to i64
  %t4645 = inttoptr i64 %t4644 to ptr
  call void @intrinsic_println(ptr %t4645)
  %t4646 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.346)
  %t4647 = ptrtoint ptr %t4646 to i64
  %t4648 = inttoptr i64 %t4647 to ptr
  call void @intrinsic_println(ptr %t4648)
  %t4649 = load i64, ptr %local.sum_a4.4345
  %t4650 = load i64, ptr %local.sum_n2.4347
  %t4651 = call i64 @"sx_f64_mul"(i64 %t4649, i64 %t4650)
  %t4652 = load i64, ptr %local.sum_a2n.4346
  %t4653 = load i64, ptr %local.sum_a2n.4346
  %t4654 = call i64 @"sx_f64_mul"(i64 %t4652, i64 %t4653)
  %t4655 = call i64 @"sx_f64_sub"(i64 %t4651, i64 %t4654)
  store i64 %t4655, ptr %local.det1.4366
  %t4656 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.347)
  store i64 %t4656, ptr %local.a_sep.4367
  %t4657 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.348)
  store i64 %t4657, ptr %local.b_sep.4368
  %t4658 = load i64, ptr %local.det1.4366
  %t4659 = call i64 @"abs_f64"(i64 %t4658)
  %t4660 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.349)
  %t4661 = call i64 @"sx_f64_gt"(i64 %t4659, i64 %t4660)
  %t4662 = icmp ne i64 %t4661, 0
  br i1 %t4662, label %then124, label %else124
then124:
  %t4663 = load i64, ptr %local.sum_ga2.4348
  %t4664 = load i64, ptr %local.sum_n2.4347
  %t4665 = call i64 @"sx_f64_mul"(i64 %t4663, i64 %t4664)
  %t4666 = load i64, ptr %local.sum_gn.4349
  %t4667 = load i64, ptr %local.sum_a2n.4346
  %t4668 = call i64 @"sx_f64_mul"(i64 %t4666, i64 %t4667)
  %t4669 = call i64 @"sx_f64_sub"(i64 %t4665, i64 %t4668)
  %t4670 = load i64, ptr %local.det1.4366
  %t4671 = call i64 @"sx_f64_div"(i64 %t4669, i64 %t4670)
  store i64 %t4671, ptr %local.a_sep.4367
  %t4672 = load i64, ptr %local.sum_gn.4349
  %t4673 = load i64, ptr %local.sum_a4.4345
  %t4674 = call i64 @"sx_f64_mul"(i64 %t4672, i64 %t4673)
  %t4675 = load i64, ptr %local.sum_ga2.4348
  %t4676 = load i64, ptr %local.sum_a2n.4346
  %t4677 = call i64 @"sx_f64_mul"(i64 %t4675, i64 %t4676)
  %t4678 = call i64 @"sx_f64_sub"(i64 %t4674, i64 %t4677)
  %t4679 = load i64, ptr %local.det1.4366
  %t4680 = call i64 @"sx_f64_div"(i64 %t4678, i64 %t4679)
  store i64 %t4680, ptr %local.b_sep.4368
  br label %then124_end
then124_end:
  br label %endif124
else124:
  br label %else124_end
else124_end:
  br label %endif124
endif124:
  %t4681 = phi i64 [ 0, %then124_end ], [ 0, %else124_end ]
  %t4682 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.350)
  %t4683 = ptrtoint ptr %t4682 to i64
  %t4684 = inttoptr i64 %t4683 to ptr
  call void @intrinsic_print(ptr %t4684)
  %t4685 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.351)
  %t4686 = ptrtoint ptr %t4685 to i64
  %t4687 = inttoptr i64 %t4686 to ptr
  call void @intrinsic_println(ptr %t4687)
  %t4688 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.352)
  %t4689 = ptrtoint ptr %t4688 to i64
  %t4690 = inttoptr i64 %t4689 to ptr
  call void @intrinsic_print(ptr %t4690)
  %t4691 = load i64, ptr %local.a_sep.4367
  %t4692 = call i64 @"print_f64"(i64 %t4691)
  %t4693 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.353)
  %t4694 = ptrtoint ptr %t4693 to i64
  %t4695 = inttoptr i64 %t4694 to ptr
  call void @intrinsic_println(ptr %t4695)
  %t4696 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.354)
  %t4697 = ptrtoint ptr %t4696 to i64
  %t4698 = inttoptr i64 %t4697 to ptr
  call void @intrinsic_print(ptr %t4698)
  %t4699 = load i64, ptr %local.b_sep.4368
  %t4700 = call i64 @"print_f64"(i64 %t4699)
  %t4701 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.355)
  %t4702 = ptrtoint ptr %t4701 to i64
  %t4703 = inttoptr i64 %t4702 to ptr
  call void @intrinsic_println(ptr %t4703)
  %t4704 = load i64, ptr %local.fit_count.4350
  store i64 %t4704, ptr %local.n_pts.4369
  %t4705 = load i64, ptr %local.sum_a2cn.4352
  %t4706 = load i64, ptr %local.n_pts.4369
  %t4707 = call i64 @"sx_f64_div"(i64 %t4705, i64 %t4706)
  store i64 %t4707, ptr %local.mean_x.4370
  %t4708 = load i64, ptr %local.sum_ga2_m.4353
  %t4709 = load i64, ptr %local.n_pts.4369
  %t4710 = call i64 @"sx_f64_div"(i64 %t4708, i64 %t4709)
  store i64 %t4710, ptr %local.mean_y.4371
  %t4711 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.356)
  %t4712 = ptrtoint ptr %t4711 to i64
  %t4713 = inttoptr i64 %t4712 to ptr
  call void @intrinsic_println(ptr %t4713)
  %t4714 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.357)
  %t4715 = ptrtoint ptr %t4714 to i64
  %t4716 = inttoptr i64 %t4715 to ptr
  call void @intrinsic_print(ptr %t4716)
  %t4717 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.358)
  %t4718 = ptrtoint ptr %t4717 to i64
  %t4719 = inttoptr i64 %t4718 to ptr
  call void @intrinsic_println(ptr %t4719)
  %t4720 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.359)
  %t4721 = ptrtoint ptr %t4720 to i64
  %t4722 = inttoptr i64 %t4721 to ptr
  call void @intrinsic_println(ptr %t4722)
  %t4723 = load i64, ptr %local.a_sep.4367
  store i64 %t4723, ptr %local.a_mult.4372
  %t4724 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.360)
  store i64 %t4724, ptr %local.c_mult.4373
  %t4725 = load i64, ptr %local.a_sep.4367
  %t4726 = call i64 @"abs_f64"(i64 %t4725)
  %t4727 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.361)
  %t4728 = call i64 @"sx_f64_gt"(i64 %t4726, i64 %t4727)
  %t4729 = icmp ne i64 %t4728, 0
  br i1 %t4729, label %then125, label %else125
then125:
  %t4730 = load i64, ptr %local.b_sep.4368
  %t4731 = load i64, ptr %local.a_sep.4367
  %t4732 = call i64 @"sx_f64_div"(i64 %t4730, i64 %t4731)
  store i64 %t4732, ptr %local.c_mult.4373
  br label %then125_end
then125_end:
  br label %endif125
else125:
  br label %else125_end
else125_end:
  br label %endif125
endif125:
  %t4733 = phi i64 [ 0, %then125_end ], [ 0, %else125_end ]
  %t4734 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.362)
  %t4735 = ptrtoint ptr %t4734 to i64
  %t4736 = inttoptr i64 %t4735 to ptr
  call void @intrinsic_print(ptr %t4736)
  %t4737 = load i64, ptr %local.a_mult.4372
  %t4738 = call i64 @"print_f64"(i64 %t4737)
  %t4739 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.363)
  %t4740 = ptrtoint ptr %t4739 to i64
  %t4741 = inttoptr i64 %t4740 to ptr
  call void @intrinsic_println(ptr %t4741)
  %t4742 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.364)
  %t4743 = ptrtoint ptr %t4742 to i64
  %t4744 = inttoptr i64 %t4743 to ptr
  call void @intrinsic_print(ptr %t4744)
  %t4745 = load i64, ptr %local.c_mult.4373
  %t4746 = call i64 @"print_f64"(i64 %t4745)
  %t4747 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.365)
  %t4748 = ptrtoint ptr %t4747 to i64
  %t4749 = inttoptr i64 %t4748 to ptr
  call void @intrinsic_println(ptr %t4749)
  %t4750 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.366)
  %t4751 = ptrtoint ptr %t4750 to i64
  %t4752 = inttoptr i64 %t4751 to ptr
  call void @intrinsic_println(ptr %t4752)
  %t4753 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.367)
  %t4754 = ptrtoint ptr %t4753 to i64
  %t4755 = inttoptr i64 %t4754 to ptr
  call void @intrinsic_print(ptr %t4755)
  %t4756 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.368)
  %t4757 = ptrtoint ptr %t4756 to i64
  %t4758 = inttoptr i64 %t4757 to ptr
  call void @intrinsic_println(ptr %t4758)
  %t4759 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.369)
  %t4760 = ptrtoint ptr %t4759 to i64
  %t4761 = inttoptr i64 %t4760 to ptr
  call void @intrinsic_print(ptr %t4761)
  %t4762 = load i64, ptr %local.a_mult.4372
  %t4763 = call i64 @"print_f64"(i64 %t4762)
  %t4764 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.370)
  %t4765 = ptrtoint ptr %t4764 to i64
  %t4766 = inttoptr i64 %t4765 to ptr
  call void @intrinsic_println(ptr %t4766)
  %t4767 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.371)
  %t4768 = ptrtoint ptr %t4767 to i64
  %t4769 = inttoptr i64 %t4768 to ptr
  call void @intrinsic_print(ptr %t4769)
  %t4770 = load i64, ptr %local.c_mult.4373
  %t4771 = call i64 @"print_f64"(i64 %t4770)
  %t4772 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.372)
  %t4773 = ptrtoint ptr %t4772 to i64
  %t4774 = inttoptr i64 %t4773 to ptr
  call void @intrinsic_println(ptr %t4774)
  %t4775 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.373)
  %t4776 = ptrtoint ptr %t4775 to i64
  %t4777 = inttoptr i64 %t4776 to ptr
  call void @intrinsic_println(ptr %t4777)
  %t4778 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.374)
  %t4779 = ptrtoint ptr %t4778 to i64
  %t4780 = inttoptr i64 %t4779 to ptr
  call void @intrinsic_println(ptr %t4780)
  %t4781 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.375)
  %t4782 = ptrtoint ptr %t4781 to i64
  %t4783 = inttoptr i64 %t4782 to ptr
  call void @intrinsic_println(ptr %t4783)
  %t4784 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.376)
  %t4785 = ptrtoint ptr %t4784 to i64
  %t4786 = inttoptr i64 %t4785 to ptr
  call void @intrinsic_println(ptr %t4786)
  %t4787 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.377)
  %t4788 = ptrtoint ptr %t4787 to i64
  %t4789 = inttoptr i64 %t4788 to ptr
  call void @intrinsic_println(ptr %t4789)
  %t4790 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.378)
  %t4791 = ptrtoint ptr %t4790 to i64
  %t4792 = inttoptr i64 %t4791 to ptr
  call void @intrinsic_println(ptr %t4792)
  %t4793 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.379)
  %t4794 = ptrtoint ptr %t4793 to i64
  %t4795 = inttoptr i64 %t4794 to ptr
  call void @intrinsic_println(ptr %t4795)
  %t4796 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.380)
  %t4797 = ptrtoint ptr %t4796 to i64
  %t4798 = inttoptr i64 %t4797 to ptr
  call void @intrinsic_println(ptr %t4798)
  %t4799 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.381)
  %t4800 = ptrtoint ptr %t4799 to i64
  %t4801 = inttoptr i64 %t4800 to ptr
  call void @intrinsic_println(ptr %t4801)
  %t4802 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.382)
  %t4803 = ptrtoint ptr %t4802 to i64
  %t4804 = inttoptr i64 %t4803 to ptr
  call void @intrinsic_println(ptr %t4804)
  %t4805 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.383)
  %t4806 = ptrtoint ptr %t4805 to i64
  %t4807 = inttoptr i64 %t4806 to ptr
  call void @intrinsic_println(ptr %t4807)
  %t4808 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.384)
  %t4809 = ptrtoint ptr %t4808 to i64
  %t4810 = inttoptr i64 %t4809 to ptr
  call void @intrinsic_println(ptr %t4810)
  %t4811 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.385)
  %t4812 = ptrtoint ptr %t4811 to i64
  %t4813 = inttoptr i64 %t4812 to ptr
  call void @intrinsic_println(ptr %t4813)
  %t4814 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.386)
  %t4815 = ptrtoint ptr %t4814 to i64
  %t4816 = inttoptr i64 %t4815 to ptr
  call void @intrinsic_println(ptr %t4816)
  %t4817 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.387)
  %t4818 = ptrtoint ptr %t4817 to i64
  %t4819 = inttoptr i64 %t4818 to ptr
  call void @intrinsic_println(ptr %t4819)
  %t4820 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.388)
  %t4821 = ptrtoint ptr %t4820 to i64
  %t4822 = inttoptr i64 %t4821 to ptr
  call void @intrinsic_print(ptr %t4822)
  %t4823 = load i64, ptr %local.a_sep.4367
  %t4824 = call i64 @"print_f64"(i64 %t4823)
  %t4825 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.389)
  %t4826 = ptrtoint ptr %t4825 to i64
  %t4827 = inttoptr i64 %t4826 to ptr
  call void @intrinsic_print(ptr %t4827)
  %t4828 = load i64, ptr %local.b_sep.4368
  %t4829 = call i64 @"print_f64"(i64 %t4828)
  %t4830 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.390)
  %t4831 = ptrtoint ptr %t4830 to i64
  %t4832 = inttoptr i64 %t4831 to ptr
  call void @intrinsic_println(ptr %t4832)
  %t4833 = load i64, ptr %local.b_sep.4368
  %t4834 = call i64 @f64_parse(ptr @.str.exp_ns_gain_surface.391)
  %t4835 = call i64 @"sx_f64_lt"(i64 %t4833, i64 %t4834)
  %t4836 = icmp ne i64 %t4835, 0
  br i1 %t4836, label %then126, label %else126
then126:
  %t4837 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.392)
  %t4838 = ptrtoint ptr %t4837 to i64
  %t4839 = inttoptr i64 %t4838 to ptr
  call void @intrinsic_println(ptr %t4839)
  br label %then126_end
then126_end:
  br label %endif126
else126:
  %t4840 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.393)
  %t4841 = ptrtoint ptr %t4840 to i64
  %t4842 = inttoptr i64 %t4841 to ptr
  call void @intrinsic_println(ptr %t4842)
  br label %else126_end
else126_end:
  br label %endif126
endif126:
  %t4843 = phi i64 [ 0, %then126_end ], [ 0, %else126_end ]
  %t4844 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_gain_surface.394)
  %t4845 = ptrtoint ptr %t4844 to i64
  %t4846 = inttoptr i64 %t4845 to ptr
  call void @intrinsic_println(ptr %t4846)
  ret i64 0
}


; String constants
@.str.exp_ns_gain_surface.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.6 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.12 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.14 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.16 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.18 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.20 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.22 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.24 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.26 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.30 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.32 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.35 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.39 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.41 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.43 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.45 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.47 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.49 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.51 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.53 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.55 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.56 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.58 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.60 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.62 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.64 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.65 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.66 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.68 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.72 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.74 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.76 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.78 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.80 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.81 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.82 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.83 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.85 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.87 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.89 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.91 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.93 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.95 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.97 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.98 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.99 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.100 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.101 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.102 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.103 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.104 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.105 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.107 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.108 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.109 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.110 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.111 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.112 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.113 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.114 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.115 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.117 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.119 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.120 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.122 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.123 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.125 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.126 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.127 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.129 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.131 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.133 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.135 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.136 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.137 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.139 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.141 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.143 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.145 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.147 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.149 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.150 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.151 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.152 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.153 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.154 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.155 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.157 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.159 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.161 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.163 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.164 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.165 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.167 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.168 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.169 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.170 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.172 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.173 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.174 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.175 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_gain_surface.176 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_gain_surface.177 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.178 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.179 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.180 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.181 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_gain_surface.182 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.183 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.184 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.185 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.187 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.188 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.189 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.191 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.192 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.193 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.194 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.195 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.196 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.197 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.198 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.199 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.200 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.201 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.202 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.203 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.205 = private unnamed_addr constant [5 x i8] c"36.0\00"
@.str.exp_ns_gain_surface.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.207 = private unnamed_addr constant [5 x i8] c"36.0\00"
@.str.exp_ns_gain_surface.208 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.209 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.210 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.213 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.215 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_gain_surface.216 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.217 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.218 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.219 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_gain_surface.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.221 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.222 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.223 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.224 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.225 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.226 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.227 = private unnamed_addr constant [5 x i8] c"25.0\00"
@.str.exp_ns_gain_surface.228 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.229 = private unnamed_addr constant [5 x i8] c"36.0\00"
@.str.exp_ns_gain_surface.230 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.231 = private unnamed_addr constant [5 x i8] c"36.0\00"
@.str.exp_ns_gain_surface.232 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.233 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.234 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.235 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.236 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.237 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.238 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.239 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_gain_surface.240 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_gain_surface.241 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.242 = private unnamed_addr constant [6 x i8] c"0.245\00"
@.str.exp_ns_gain_surface.243 = private unnamed_addr constant [6 x i8] c"0.245\00"
@.str.exp_ns_gain_surface.244 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.245 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.246 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.247 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.248 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_gain_surface.249 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.250 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.251 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_gain_surface.252 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_gain_surface.253 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_gain_surface.254 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.255 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_gain_surface.256 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.257 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_gain_surface.258 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_gain_surface.259 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_gain_surface.260 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.261 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_gain_surface.262 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_gain_surface.263 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_gain_surface.264 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_gain_surface.265 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.266 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.267 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.268 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.269 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.270 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.271 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ns_gain_surface.272 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.273 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.274 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.275 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.276 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_ns_gain_surface.277 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.278 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.279 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.280 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.281 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_gain_surface.282 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_gain_surface.283 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.284 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.285 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_gain_surface.286 = private unnamed_addr constant [5 x i8] c"12.0\00"
@.str.exp_ns_gain_surface.287 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_gain_surface.288 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_gain_surface.289 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.290 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_gain_surface.291 = private unnamed_addr constant [61 x i8] c"#  GAIN SURFACE: G(A, N)                                   #\00"
@.str.exp_ns_gain_surface.292 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_gain_surface.293 = private unnamed_addr constant [61 x i8] c"#  Compute the feedback loop gain on a fine (N, A) grid.   #\00"
@.str.exp_ns_gain_surface.294 = private unnamed_addr constant [61 x i8] c"#  Identify the functional form G(A, N).                   #\00"
@.str.exp_ns_gain_surface.295 = private unnamed_addr constant [62 x i8] c"#  If G < 1 provably for all N → proof of regularity.     #\00"
@.str.exp_ns_gain_surface.296 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_gain_surface.297 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.298 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_gain_surface.299 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.300 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.301 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_gain_surface.302 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_gain_surface.303 = private unnamed_addr constant [45 x i8] c"  === Phase 1: Compute gain grid G(A, N) ===\00"
@.str.exp_ns_gain_surface.304 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.305 = private unnamed_addr constant [51 x i8] c"  N     A       G_max        G_avg        Bounded?\00"
@.str.exp_ns_gain_surface.306 = private unnamed_addr constant [51 x i8] c"  ---   ----    ---------    ---------    --------\00"
@.str.exp_ns_gain_surface.307 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.308 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.309 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.310 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.311 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.312 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.313 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.314 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.315 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.316 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_gain_surface.317 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_ns_gain_surface.318 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_gain_surface.319 = private unnamed_addr constant [5 x i8] c"12.0\00"
@.str.exp_ns_gain_surface.320 = private unnamed_addr constant [5 x i8] c"16.0\00"
@.str.exp_ns_gain_surface.321 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_ns_gain_surface.322 = private unnamed_addr constant [5 x i8] c"24.0\00"
@.str.exp_ns_gain_surface.323 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_gain_surface.324 = private unnamed_addr constant [5 x i8] c"0.10\00"
@.str.exp_ns_gain_surface.325 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_gain_surface.326 = private unnamed_addr constant [5 x i8] c"0.20\00"
@.str.exp_ns_gain_surface.327 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_ns_gain_surface.328 = private unnamed_addr constant [5 x i8] c"0.30\00"
@.str.exp_ns_gain_surface.329 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_gain_surface.330 = private unnamed_addr constant [5 x i8] c"0.40\00"
@.str.exp_ns_gain_surface.331 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_ns_gain_surface.332 = private unnamed_addr constant [5 x i8] c"0.50\00"
@.str.exp_ns_gain_surface.333 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.334 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.335 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_gain_surface.336 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_ns_gain_surface.337 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_gain_surface.338 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_gain_surface.339 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_gain_surface.340 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_gain_surface.341 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_gain_surface.342 = private unnamed_addr constant [7 x i8] c"   YES\00"
@.str.exp_ns_gain_surface.343 = private unnamed_addr constant [6 x i8] c"   NO\00"
@.str.exp_ns_gain_surface.344 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.345 = private unnamed_addr constant [50 x i8] c"  === Phase 2: Fit G(A, N) to candidate forms ===\00"
@.str.exp_ns_gain_surface.346 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.347 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.348 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.349 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_gain_surface.350 = private unnamed_addr constant [26 x i8] c"  Form 1: G = a*A^2 + b/N\00"
@.str.exp_ns_gain_surface.351 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.352 = private unnamed_addr constant [9 x i8] c"    a = \00"
@.str.exp_ns_gain_surface.353 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.354 = private unnamed_addr constant [9 x i8] c"    b = \00"
@.str.exp_ns_gain_surface.355 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.356 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.357 = private unnamed_addr constant [32 x i8] c"  Form 2: G = a*A^2 * (1 + c/N)\00"
@.str.exp_ns_gain_surface.358 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.359 = private unnamed_addr constant [66 x i8] c"    (requires per-point storage; approximated from separable fit)\00"
@.str.exp_ns_gain_surface.360 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.361 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_ns_gain_surface.362 = private unnamed_addr constant [11 x i8] c"    a ≈ \00"
@.str.exp_ns_gain_surface.363 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.364 = private unnamed_addr constant [11 x i8] c"    c ≈ \00"
@.str.exp_ns_gain_surface.365 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.366 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.367 = private unnamed_addr constant [32 x i8] c"  Form 3: G = a*A^2 / (1 - d/N)\00"
@.str.exp_ns_gain_surface.368 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.369 = private unnamed_addr constant [11 x i8] c"    a ≈ \00"
@.str.exp_ns_gain_surface.370 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.371 = private unnamed_addr constant [11 x i8] c"    d ≈ \00"
@.str.exp_ns_gain_surface.372 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.373 = private unnamed_addr constant [63 x i8] c"    (pole form and multiplicative form agree at leading order)\00"
@.str.exp_ns_gain_surface.374 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.375 = private unnamed_addr constant [30 x i8] c"  === Phase 3: Assessment ===\00"
@.str.exp_ns_gain_surface.376 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.377 = private unnamed_addr constant [55 x i8] c"  KEY QUESTION: does G_max < 1 for all N at A < A*(N)?\00"
@.str.exp_ns_gain_surface.378 = private unnamed_addr constant [38 x i8] c"  If G(A, N) = a*A^2 + b/N and b > 0:\00"
@.str.exp_ns_gain_surface.379 = private unnamed_addr constant [39 x i8] c"    G < 1 requires A^2 < (1 - b/N) / a\00"
@.str.exp_ns_gain_surface.380 = private unnamed_addr constant [50 x i8] c"    A* ~ sqrt((1 - b/N) / a) — decreases with N\00"
@.str.exp_ns_gain_surface.381 = private unnamed_addr constant [38 x i8] c"  If G(A, N) = a*A^2 + b/N and b < 0:\00"
@.str.exp_ns_gain_surface.382 = private unnamed_addr constant [54 x i8] c"    G < 1 always easier at large N — diffusion wins\00"
@.str.exp_ns_gain_surface.383 = private unnamed_addr constant [43 x i8] c"    A* increases with N — PROOF FRIENDLY\00"
@.str.exp_ns_gain_surface.384 = private unnamed_addr constant [41 x i8] c"  If G(A, N) = a*A^2*(1+c/N) with c > 0:\00"
@.str.exp_ns_gain_surface.385 = private unnamed_addr constant [59 x i8] c"    G → a*A^2 as N → inf — bounded by finite-N limit\00"
@.str.exp_ns_gain_surface.386 = private unnamed_addr constant [60 x i8] c"    A* → 1/sqrt(a) — the infinite-mode threshold EXISTS\00"
@.str.exp_ns_gain_surface.387 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.388 = private unnamed_addr constant [13 x i8] c"  Fitted: a=\00"
@.str.exp_ns_gain_surface.389 = private unnamed_addr constant [5 x i8] c"  b=\00"
@.str.exp_ns_gain_surface.390 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_gain_surface.391 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_gain_surface.392 = private unnamed_addr constant [62 x i8] c"  b < 0 → diffusion dominates at large N → PROOF FRIENDLY\00"
@.str.exp_ns_gain_surface.393 = private unnamed_addr constant [59 x i8] c"  b > 0 → coupling grows with N (needs further analysis)\00"
@.str.exp_ns_gain_surface.394 = private unnamed_addr constant [1 x i8] c"\00"
