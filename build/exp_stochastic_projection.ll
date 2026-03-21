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
  %t1 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.r.13 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t14 = load i64, ptr %local.state
  store i64 %t14, ptr %local.s.12
  %t15 = load i64, ptr %local.s.12
  %t16 = icmp slt i64 %t15, 0
  %t17 = zext i1 %t16 to i64
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then1, label %else1
then1:
  %t19 = load i64, ptr %local.s.12
  %t20 = sub i64 0, %t19
  store i64 %t20, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t21 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t22 = load i64, ptr %local.s.12
  %t23 = srem i64 %t22, 2147483647
  store i64 %t23, ptr %local.r.13
  %t24 = load i64, ptr %local.r.13
  %t25 = call i64 @"sx_int_to_f64"(i64 %t24)
  %t26 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.2)
  %t27 = call i64 @"sx_f64_div"(i64 %t25, i64 %t26)
  ret i64 %t27
}

define i64 @"train_with_noise"(i64 %t0, i64 %t1, i64 %t2, i64 %t3, i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %v0, i64 %v1, i64 %v2, i64 %v3, i64 %noise_amp, i64 %steps, i64 %lr, i64 %seed) nounwind {
entry:
  %local.w0.28 = alloca i64
  %local.w1.29 = alloca i64
  %local.w2.30 = alloca i64
  %local.w3.31 = alloca i64
  %local.step.32 = alloca i64
  %local.rng.33 = alloca i64
  %local.ga0.34 = alloca i64
  %local.ga1.35 = alloca i64
  %local.ga2.36 = alloca i64
  %local.ga3.37 = alloca i64
  %local.gb0.38 = alloca i64
  %local.gb1.39 = alloca i64
  %local.gb2.40 = alloca i64
  %local.gb3.41 = alloca i64
  %local.gc0.42 = alloca i64
  %local.gc1.43 = alloca i64
  %local.gc2.44 = alloca i64
  %local.gc3.45 = alloca i64
  %local.wa.46 = alloca i64
  %local.wb.47 = alloca i64
  %local.wc.48 = alloca i64
  %local.noise.49 = alloca i64
  %local.la.50 = alloca i64
  %local.lb.51 = alloca i64
  %local.lc.52 = alloca i64
  %local.t0 = alloca i64
  store i64 %t0, ptr %local.t0
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.v0 = alloca i64
  store i64 %v0, ptr %local.v0
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %local.v3 = alloca i64
  store i64 %v3, ptr %local.v3
  %local.noise_amp = alloca i64
  store i64 %noise_amp, ptr %local.noise_amp
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t53 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.3)
  store i64 %t53, ptr %local.w0.28
  %t54 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.4)
  store i64 %t54, ptr %local.w1.29
  %t55 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.5)
  store i64 %t55, ptr %local.w2.30
  %t56 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.6)
  store i64 %t56, ptr %local.w3.31
  store i64 0, ptr %local.step.32
  %t57 = load i64, ptr %local.seed
  store i64 %t57, ptr %local.rng.33
  %t58 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.7)
  store i64 %t58, ptr %local.ga0.34
  %t59 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.8)
  store i64 %t59, ptr %local.ga1.35
  %t60 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.9)
  store i64 %t60, ptr %local.ga2.36
  %t61 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.10)
  store i64 %t61, ptr %local.ga3.37
  %t62 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.11)
  store i64 %t62, ptr %local.gb0.38
  %t63 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.12)
  store i64 %t63, ptr %local.gb1.39
  %t64 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.13)
  store i64 %t64, ptr %local.gb2.40
  %t65 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.14)
  store i64 %t65, ptr %local.gb3.41
  %t66 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.15)
  store i64 %t66, ptr %local.gc0.42
  %t67 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.16)
  store i64 %t67, ptr %local.gc1.43
  %t68 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.17)
  store i64 %t68, ptr %local.gc2.44
  %t69 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.18)
  store i64 %t69, ptr %local.gc3.45
  %t70 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.19)
  store i64 %t70, ptr %local.wa.46
  %t71 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.20)
  store i64 %t71, ptr %local.wb.47
  %t72 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.21)
  store i64 %t72, ptr %local.wc.48
  %t73 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.22)
  store i64 %t73, ptr %local.noise.49
  br label %loop2
loop2:
  %t74 = load i64, ptr %local.step.32
  %t75 = load i64, ptr %local.steps
  %t76 = icmp slt i64 %t74, %t75
  %t77 = zext i1 %t76 to i64
  %t78 = icmp ne i64 %t77, 0
  br i1 %t78, label %body2, label %endloop2
body2:
  %t79 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.23)
  %t80 = load i64, ptr %local.w0.28
  %t81 = load i64, ptr %local.t0
  %t82 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_mul"(i64 %t79, i64 %t82)
  store i64 %t83, ptr %local.ga0.34
  %t84 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.24)
  %t85 = load i64, ptr %local.w1.29
  %t86 = load i64, ptr %local.t1
  %t87 = call i64 @"sx_f64_sub"(i64 %t85, i64 %t86)
  %t88 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t87)
  store i64 %t88, ptr %local.ga1.35
  %t89 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.25)
  %t90 = load i64, ptr %local.w2.30
  %t91 = load i64, ptr %local.t2
  %t92 = call i64 @"sx_f64_sub"(i64 %t90, i64 %t91)
  %t93 = call i64 @"sx_f64_mul"(i64 %t89, i64 %t92)
  store i64 %t93, ptr %local.ga2.36
  %t94 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.26)
  %t95 = load i64, ptr %local.w3.31
  %t96 = load i64, ptr %local.t3
  %t97 = call i64 @"sx_f64_sub"(i64 %t95, i64 %t96)
  %t98 = call i64 @"sx_f64_mul"(i64 %t94, i64 %t97)
  store i64 %t98, ptr %local.ga3.37
  %t99 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.27)
  %t100 = load i64, ptr %local.w0.28
  %t101 = load i64, ptr %local.u0
  %t102 = call i64 @"sx_f64_sub"(i64 %t100, i64 %t101)
  %t103 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t102)
  store i64 %t103, ptr %local.gb0.38
  %t104 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.28)
  %t105 = load i64, ptr %local.w1.29
  %t106 = load i64, ptr %local.u1
  %t107 = call i64 @"sx_f64_sub"(i64 %t105, i64 %t106)
  %t108 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t107)
  store i64 %t108, ptr %local.gb1.39
  %t109 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.29)
  %t110 = load i64, ptr %local.w2.30
  %t111 = load i64, ptr %local.u2
  %t112 = call i64 @"sx_f64_sub"(i64 %t110, i64 %t111)
  %t113 = call i64 @"sx_f64_mul"(i64 %t109, i64 %t112)
  store i64 %t113, ptr %local.gb2.40
  %t114 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.30)
  %t115 = load i64, ptr %local.w3.31
  %t116 = load i64, ptr %local.u3
  %t117 = call i64 @"sx_f64_sub"(i64 %t115, i64 %t116)
  %t118 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t117)
  store i64 %t118, ptr %local.gb3.41
  %t119 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.31)
  %t120 = load i64, ptr %local.w0.28
  %t121 = load i64, ptr %local.v0
  %t122 = call i64 @"sx_f64_sub"(i64 %t120, i64 %t121)
  %t123 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t122)
  store i64 %t123, ptr %local.gc0.42
  %t124 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.32)
  %t125 = load i64, ptr %local.w1.29
  %t126 = load i64, ptr %local.v1
  %t127 = call i64 @"sx_f64_sub"(i64 %t125, i64 %t126)
  %t128 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t127)
  store i64 %t128, ptr %local.gc1.43
  %t129 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.33)
  %t130 = load i64, ptr %local.w2.30
  %t131 = load i64, ptr %local.v2
  %t132 = call i64 @"sx_f64_sub"(i64 %t130, i64 %t131)
  %t133 = call i64 @"sx_f64_mul"(i64 %t129, i64 %t132)
  store i64 %t133, ptr %local.gc2.44
  %t134 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.34)
  %t135 = load i64, ptr %local.w3.31
  %t136 = load i64, ptr %local.v3
  %t137 = call i64 @"sx_f64_sub"(i64 %t135, i64 %t136)
  %t138 = call i64 @"sx_f64_mul"(i64 %t134, i64 %t137)
  store i64 %t138, ptr %local.gc3.45
  %t139 = load i64, ptr %local.rng.33
  %t140 = call i64 @"lcg_next"(i64 %t139)
  store i64 %t140, ptr %local.rng.33
  %t141 = load i64, ptr %local.rng.33
  %t142 = call i64 @"lcg_f64"(i64 %t141)
  %t143 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.35)
  %t144 = call i64 @"sx_f64_sub"(i64 %t142, i64 %t143)
  %t145 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.36)
  %t146 = call i64 @"sx_f64_mul"(i64 %t144, i64 %t145)
  %t147 = load i64, ptr %local.noise_amp
  %t148 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t147)
  store i64 %t148, ptr %local.noise.49
  %t149 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.37)
  %t150 = load i64, ptr %local.noise.49
  %t151 = call i64 @"sx_f64_add"(i64 %t149, i64 %t150)
  store i64 %t151, ptr %local.wa.46
  %t152 = load i64, ptr %local.rng.33
  %t153 = call i64 @"lcg_next"(i64 %t152)
  store i64 %t153, ptr %local.rng.33
  %t154 = load i64, ptr %local.rng.33
  %t155 = call i64 @"lcg_f64"(i64 %t154)
  %t156 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.38)
  %t157 = call i64 @"sx_f64_sub"(i64 %t155, i64 %t156)
  %t158 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.39)
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  %t160 = load i64, ptr %local.noise_amp
  %t161 = call i64 @"sx_f64_mul"(i64 %t159, i64 %t160)
  store i64 %t161, ptr %local.noise.49
  %t162 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.40)
  %t163 = load i64, ptr %local.noise.49
  %t164 = call i64 @"sx_f64_add"(i64 %t162, i64 %t163)
  store i64 %t164, ptr %local.wb.47
  %t165 = load i64, ptr %local.rng.33
  %t166 = call i64 @"lcg_next"(i64 %t165)
  store i64 %t166, ptr %local.rng.33
  %t167 = load i64, ptr %local.rng.33
  %t168 = call i64 @"lcg_f64"(i64 %t167)
  %t169 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.41)
  %t170 = call i64 @"sx_f64_sub"(i64 %t168, i64 %t169)
  %t171 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.42)
  %t172 = call i64 @"sx_f64_mul"(i64 %t170, i64 %t171)
  %t173 = load i64, ptr %local.noise_amp
  %t174 = call i64 @"sx_f64_mul"(i64 %t172, i64 %t173)
  store i64 %t174, ptr %local.noise.49
  %t175 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.43)
  %t176 = load i64, ptr %local.noise.49
  %t177 = call i64 @"sx_f64_add"(i64 %t175, i64 %t176)
  store i64 %t177, ptr %local.wc.48
  %t178 = load i64, ptr %local.w0.28
  %t179 = load i64, ptr %local.lr
  %t180 = load i64, ptr %local.wa.46
  %t181 = load i64, ptr %local.ga0.34
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  %t183 = load i64, ptr %local.wb.47
  %t184 = load i64, ptr %local.gb0.38
  %t185 = call i64 @"sx_f64_mul"(i64 %t183, i64 %t184)
  %t186 = call i64 @"sx_f64_add"(i64 %t182, i64 %t185)
  %t187 = load i64, ptr %local.wc.48
  %t188 = load i64, ptr %local.gc0.42
  %t189 = call i64 @"sx_f64_mul"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_add"(i64 %t186, i64 %t189)
  %t191 = call i64 @"sx_f64_mul"(i64 %t179, i64 %t190)
  %t192 = call i64 @"sx_f64_sub"(i64 %t178, i64 %t191)
  store i64 %t192, ptr %local.w0.28
  %t193 = load i64, ptr %local.w1.29
  %t194 = load i64, ptr %local.lr
  %t195 = load i64, ptr %local.wa.46
  %t196 = load i64, ptr %local.ga1.35
  %t197 = call i64 @"sx_f64_mul"(i64 %t195, i64 %t196)
  %t198 = load i64, ptr %local.wb.47
  %t199 = load i64, ptr %local.gb1.39
  %t200 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t199)
  %t201 = call i64 @"sx_f64_add"(i64 %t197, i64 %t200)
  %t202 = load i64, ptr %local.wc.48
  %t203 = load i64, ptr %local.gc1.43
  %t204 = call i64 @"sx_f64_mul"(i64 %t202, i64 %t203)
  %t205 = call i64 @"sx_f64_add"(i64 %t201, i64 %t204)
  %t206 = call i64 @"sx_f64_mul"(i64 %t194, i64 %t205)
  %t207 = call i64 @"sx_f64_sub"(i64 %t193, i64 %t206)
  store i64 %t207, ptr %local.w1.29
  %t208 = load i64, ptr %local.w2.30
  %t209 = load i64, ptr %local.lr
  %t210 = load i64, ptr %local.wa.46
  %t211 = load i64, ptr %local.ga2.36
  %t212 = call i64 @"sx_f64_mul"(i64 %t210, i64 %t211)
  %t213 = load i64, ptr %local.wb.47
  %t214 = load i64, ptr %local.gb2.40
  %t215 = call i64 @"sx_f64_mul"(i64 %t213, i64 %t214)
  %t216 = call i64 @"sx_f64_add"(i64 %t212, i64 %t215)
  %t217 = load i64, ptr %local.wc.48
  %t218 = load i64, ptr %local.gc2.44
  %t219 = call i64 @"sx_f64_mul"(i64 %t217, i64 %t218)
  %t220 = call i64 @"sx_f64_add"(i64 %t216, i64 %t219)
  %t221 = call i64 @"sx_f64_mul"(i64 %t209, i64 %t220)
  %t222 = call i64 @"sx_f64_sub"(i64 %t208, i64 %t221)
  store i64 %t222, ptr %local.w2.30
  %t223 = load i64, ptr %local.w3.31
  %t224 = load i64, ptr %local.lr
  %t225 = load i64, ptr %local.wa.46
  %t226 = load i64, ptr %local.ga3.37
  %t227 = call i64 @"sx_f64_mul"(i64 %t225, i64 %t226)
  %t228 = load i64, ptr %local.wb.47
  %t229 = load i64, ptr %local.gb3.41
  %t230 = call i64 @"sx_f64_mul"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_add"(i64 %t227, i64 %t230)
  %t232 = load i64, ptr %local.wc.48
  %t233 = load i64, ptr %local.gc3.45
  %t234 = call i64 @"sx_f64_mul"(i64 %t232, i64 %t233)
  %t235 = call i64 @"sx_f64_add"(i64 %t231, i64 %t234)
  %t236 = call i64 @"sx_f64_mul"(i64 %t224, i64 %t235)
  %t237 = call i64 @"sx_f64_sub"(i64 %t223, i64 %t236)
  store i64 %t237, ptr %local.w3.31
  %t238 = load i64, ptr %local.step.32
  %t239 = add i64 %t238, 1
  store i64 %t239, ptr %local.step.32
  br label %loop2
endloop2:
  %t240 = load i64, ptr %local.w0.28
  %t241 = load i64, ptr %local.t0
  %t242 = call i64 @"sx_f64_sub"(i64 %t240, i64 %t241)
  %t243 = load i64, ptr %local.w0.28
  %t244 = load i64, ptr %local.t0
  %t245 = call i64 @"sx_f64_sub"(i64 %t243, i64 %t244)
  %t246 = call i64 @"sx_f64_mul"(i64 %t242, i64 %t245)
  %t247 = load i64, ptr %local.w1.29
  %t248 = load i64, ptr %local.t1
  %t249 = call i64 @"sx_f64_sub"(i64 %t247, i64 %t248)
  %t250 = load i64, ptr %local.w1.29
  %t251 = load i64, ptr %local.t1
  %t252 = call i64 @"sx_f64_sub"(i64 %t250, i64 %t251)
  %t253 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t252)
  %t254 = call i64 @"sx_f64_add"(i64 %t246, i64 %t253)
  %t255 = load i64, ptr %local.w2.30
  %t256 = load i64, ptr %local.t2
  %t257 = call i64 @"sx_f64_sub"(i64 %t255, i64 %t256)
  %t258 = load i64, ptr %local.w2.30
  %t259 = load i64, ptr %local.t2
  %t260 = call i64 @"sx_f64_sub"(i64 %t258, i64 %t259)
  %t261 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t260)
  %t262 = call i64 @"sx_f64_add"(i64 %t254, i64 %t261)
  %t263 = load i64, ptr %local.w3.31
  %t264 = load i64, ptr %local.t3
  %t265 = call i64 @"sx_f64_sub"(i64 %t263, i64 %t264)
  %t266 = load i64, ptr %local.w3.31
  %t267 = load i64, ptr %local.t3
  %t268 = call i64 @"sx_f64_sub"(i64 %t266, i64 %t267)
  %t269 = call i64 @"sx_f64_mul"(i64 %t265, i64 %t268)
  %t270 = call i64 @"sx_f64_add"(i64 %t262, i64 %t269)
  store i64 %t270, ptr %local.la.50
  %t271 = load i64, ptr %local.w0.28
  %t272 = load i64, ptr %local.u0
  %t273 = call i64 @"sx_f64_sub"(i64 %t271, i64 %t272)
  %t274 = load i64, ptr %local.w0.28
  %t275 = load i64, ptr %local.u0
  %t276 = call i64 @"sx_f64_sub"(i64 %t274, i64 %t275)
  %t277 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t276)
  %t278 = load i64, ptr %local.w1.29
  %t279 = load i64, ptr %local.u1
  %t280 = call i64 @"sx_f64_sub"(i64 %t278, i64 %t279)
  %t281 = load i64, ptr %local.w1.29
  %t282 = load i64, ptr %local.u1
  %t283 = call i64 @"sx_f64_sub"(i64 %t281, i64 %t282)
  %t284 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t283)
  %t285 = call i64 @"sx_f64_add"(i64 %t277, i64 %t284)
  %t286 = load i64, ptr %local.w2.30
  %t287 = load i64, ptr %local.u2
  %t288 = call i64 @"sx_f64_sub"(i64 %t286, i64 %t287)
  %t289 = load i64, ptr %local.w2.30
  %t290 = load i64, ptr %local.u2
  %t291 = call i64 @"sx_f64_sub"(i64 %t289, i64 %t290)
  %t292 = call i64 @"sx_f64_mul"(i64 %t288, i64 %t291)
  %t293 = call i64 @"sx_f64_add"(i64 %t285, i64 %t292)
  %t294 = load i64, ptr %local.w3.31
  %t295 = load i64, ptr %local.u3
  %t296 = call i64 @"sx_f64_sub"(i64 %t294, i64 %t295)
  %t297 = load i64, ptr %local.w3.31
  %t298 = load i64, ptr %local.u3
  %t299 = call i64 @"sx_f64_sub"(i64 %t297, i64 %t298)
  %t300 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t299)
  %t301 = call i64 @"sx_f64_add"(i64 %t293, i64 %t300)
  store i64 %t301, ptr %local.lb.51
  %t302 = load i64, ptr %local.w0.28
  %t303 = load i64, ptr %local.v0
  %t304 = call i64 @"sx_f64_sub"(i64 %t302, i64 %t303)
  %t305 = load i64, ptr %local.w0.28
  %t306 = load i64, ptr %local.v0
  %t307 = call i64 @"sx_f64_sub"(i64 %t305, i64 %t306)
  %t308 = call i64 @"sx_f64_mul"(i64 %t304, i64 %t307)
  %t309 = load i64, ptr %local.w1.29
  %t310 = load i64, ptr %local.v1
  %t311 = call i64 @"sx_f64_sub"(i64 %t309, i64 %t310)
  %t312 = load i64, ptr %local.w1.29
  %t313 = load i64, ptr %local.v1
  %t314 = call i64 @"sx_f64_sub"(i64 %t312, i64 %t313)
  %t315 = call i64 @"sx_f64_mul"(i64 %t311, i64 %t314)
  %t316 = call i64 @"sx_f64_add"(i64 %t308, i64 %t315)
  %t317 = load i64, ptr %local.w2.30
  %t318 = load i64, ptr %local.v2
  %t319 = call i64 @"sx_f64_sub"(i64 %t317, i64 %t318)
  %t320 = load i64, ptr %local.w2.30
  %t321 = load i64, ptr %local.v2
  %t322 = call i64 @"sx_f64_sub"(i64 %t320, i64 %t321)
  %t323 = call i64 @"sx_f64_mul"(i64 %t319, i64 %t322)
  %t324 = call i64 @"sx_f64_add"(i64 %t316, i64 %t323)
  %t325 = load i64, ptr %local.w3.31
  %t326 = load i64, ptr %local.v3
  %t327 = call i64 @"sx_f64_sub"(i64 %t325, i64 %t326)
  %t328 = load i64, ptr %local.w3.31
  %t329 = load i64, ptr %local.v3
  %t330 = call i64 @"sx_f64_sub"(i64 %t328, i64 %t329)
  %t331 = call i64 @"sx_f64_mul"(i64 %t327, i64 %t330)
  %t332 = call i64 @"sx_f64_add"(i64 %t324, i64 %t331)
  store i64 %t332, ptr %local.lc.52
  %t333 = load i64, ptr %local.la.50
  %t334 = load i64, ptr %local.lb.51
  %t335 = call i64 @"sx_f64_add"(i64 %t333, i64 %t334)
  %t336 = load i64, ptr %local.lc.52
  %t337 = call i64 @"sx_f64_add"(i64 %t335, i64 %t336)
  ret i64 %t337
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.t0.338 = alloca i64
  %local.t1.339 = alloca i64
  %local.t2.340 = alloca i64
  %local.t3.341 = alloca i64
  %local.u0.342 = alloca i64
  %local.u1.343 = alloca i64
  %local.u2.344 = alloca i64
  %local.u3.345 = alloca i64
  %local.v0.346 = alloca i64
  %local.v1.347 = alloca i64
  %local.v2.348 = alloca i64
  %local.v3.349 = alloca i64
  %local.steps.350 = alloca i64
  %local.lr.351 = alloca i64
  %local.amp.352 = alloca i64
  %local.best_amp.353 = alloca i64
  %local.best_loss.354 = alloca i64
  %local.sweep.355 = alloca i64
  %local.l1.356 = alloca i64
  %local.l2.357 = alloca i64
  %local.l3.358 = alloca i64
  %local.l4.359 = alloca i64
  %local.l5.360 = alloca i64
  %local.avg_loss.361 = alloca i64
  %local.learned_amp.362 = alloca i64
  %local.cycle.363 = alloca i64
  %local.mg.364 = alloca i64
  %local.h.365 = alloca i64
  %local.meta_lr.366 = alloca i64
  %local.lp1.367 = alloca i64
  %local.lp2.368 = alloca i64
  %local.lm1.369 = alloca i64
  %local.lm2.370 = alloca i64
  %local.avg_p.371 = alloca i64
  %local.avg_m.372 = alloca i64
  %local.cl.373 = alloca i64
  %local.cl.374 = alloca i64
  %local.final_loss.375 = alloca i64
  %t376 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.44)
  %t377 = ptrtoint ptr %t376 to i64
  %t378 = inttoptr i64 %t377 to ptr
  call void @intrinsic_println(ptr %t378)
  %t379 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.45)
  %t380 = ptrtoint ptr %t379 to i64
  %t381 = inttoptr i64 %t380 to ptr
  call void @intrinsic_println(ptr %t381)
  %t382 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.46)
  %t383 = ptrtoint ptr %t382 to i64
  %t384 = inttoptr i64 %t383 to ptr
  call void @intrinsic_println(ptr %t384)
  %t385 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.47)
  %t386 = ptrtoint ptr %t385 to i64
  %t387 = inttoptr i64 %t386 to ptr
  call void @intrinsic_println(ptr %t387)
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.48)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_println(ptr %t390)
  %t391 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.49)
  store i64 %t391, ptr %local.t0.338
  %t392 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.50)
  store i64 %t392, ptr %local.t1.339
  %t393 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.51)
  %t394 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.52)
  %t395 = call i64 @"sx_f64_sub"(i64 %t393, i64 %t394)
  store i64 %t395, ptr %local.t2.340
  %t396 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.53)
  store i64 %t396, ptr %local.t3.341
  %t397 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.54)
  %t398 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.55)
  %t399 = call i64 @"sx_f64_sub"(i64 %t397, i64 %t398)
  store i64 %t399, ptr %local.u0.342
  %t400 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.56)
  %t401 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.57)
  %t402 = call i64 @"sx_f64_sub"(i64 %t400, i64 %t401)
  store i64 %t402, ptr %local.u1.343
  %t403 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.58)
  store i64 %t403, ptr %local.u2.344
  %t404 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.59)
  %t405 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.60)
  %t406 = call i64 @"sx_f64_sub"(i64 %t404, i64 %t405)
  store i64 %t406, ptr %local.u3.345
  %t407 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.61)
  %t408 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.62)
  %t409 = call i64 @"sx_f64_sub"(i64 %t407, i64 %t408)
  store i64 %t409, ptr %local.v0.346
  %t410 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.63)
  store i64 %t410, ptr %local.v1.347
  %t411 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.64)
  %t412 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.65)
  %t413 = call i64 @"sx_f64_sub"(i64 %t411, i64 %t412)
  store i64 %t413, ptr %local.v2.348
  %t414 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.66)
  %t415 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.67)
  %t416 = call i64 @"sx_f64_sub"(i64 %t414, i64 %t415)
  store i64 %t416, ptr %local.v3.349
  store i64 1000, ptr %local.steps.350
  %t417 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.68)
  store i64 %t417, ptr %local.lr.351
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.69)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.70)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_println(ptr %t423)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.71)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.72)
  store i64 %t427, ptr %local.amp.352
  %t428 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.73)
  store i64 %t428, ptr %local.best_amp.353
  %t429 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.74)
  store i64 %t429, ptr %local.best_loss.354
  store i64 0, ptr %local.sweep.355
  br label %loop3
loop3:
  %t430 = load i64, ptr %local.sweep.355
  %t431 = icmp slt i64 %t430, 11
  %t432 = zext i1 %t431 to i64
  %t433 = icmp ne i64 %t432, 0
  br i1 %t433, label %body3, label %endloop3
body3:
  %t434 = load i64, ptr %local.sweep.355
  %t435 = call i64 @"sx_int_to_f64"(i64 %t434)
  %t436 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.75)
  %t437 = call i64 @"sx_f64_mul"(i64 %t435, i64 %t436)
  store i64 %t437, ptr %local.amp.352
  %t438 = load i64, ptr %local.t0.338
  %t439 = load i64, ptr %local.t1.339
  %t440 = load i64, ptr %local.t2.340
  %t441 = load i64, ptr %local.t3.341
  %t442 = load i64, ptr %local.u0.342
  %t443 = load i64, ptr %local.u1.343
  %t444 = load i64, ptr %local.u2.344
  %t445 = load i64, ptr %local.u3.345
  %t446 = load i64, ptr %local.v0.346
  %t447 = load i64, ptr %local.v1.347
  %t448 = load i64, ptr %local.v2.348
  %t449 = load i64, ptr %local.v3.349
  %t450 = load i64, ptr %local.amp.352
  %t451 = load i64, ptr %local.steps.350
  %t452 = load i64, ptr %local.lr.351
  %t453 = call i64 @"train_with_noise"(i64 %t438, i64 %t439, i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 %t446, i64 %t447, i64 %t448, i64 %t449, i64 %t450, i64 %t451, i64 %t452, i64 42)
  store i64 %t453, ptr %local.l1.356
  %t454 = load i64, ptr %local.t0.338
  %t455 = load i64, ptr %local.t1.339
  %t456 = load i64, ptr %local.t2.340
  %t457 = load i64, ptr %local.t3.341
  %t458 = load i64, ptr %local.u0.342
  %t459 = load i64, ptr %local.u1.343
  %t460 = load i64, ptr %local.u2.344
  %t461 = load i64, ptr %local.u3.345
  %t462 = load i64, ptr %local.v0.346
  %t463 = load i64, ptr %local.v1.347
  %t464 = load i64, ptr %local.v2.348
  %t465 = load i64, ptr %local.v3.349
  %t466 = load i64, ptr %local.amp.352
  %t467 = load i64, ptr %local.steps.350
  %t468 = load i64, ptr %local.lr.351
  %t469 = call i64 @"train_with_noise"(i64 %t454, i64 %t455, i64 %t456, i64 %t457, i64 %t458, i64 %t459, i64 %t460, i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 %t465, i64 %t466, i64 %t467, i64 %t468, i64 137)
  store i64 %t469, ptr %local.l2.357
  %t470 = load i64, ptr %local.t0.338
  %t471 = load i64, ptr %local.t1.339
  %t472 = load i64, ptr %local.t2.340
  %t473 = load i64, ptr %local.t3.341
  %t474 = load i64, ptr %local.u0.342
  %t475 = load i64, ptr %local.u1.343
  %t476 = load i64, ptr %local.u2.344
  %t477 = load i64, ptr %local.u3.345
  %t478 = load i64, ptr %local.v0.346
  %t479 = load i64, ptr %local.v1.347
  %t480 = load i64, ptr %local.v2.348
  %t481 = load i64, ptr %local.v3.349
  %t482 = load i64, ptr %local.amp.352
  %t483 = load i64, ptr %local.steps.350
  %t484 = load i64, ptr %local.lr.351
  %t485 = call i64 @"train_with_noise"(i64 %t470, i64 %t471, i64 %t472, i64 %t473, i64 %t474, i64 %t475, i64 %t476, i64 %t477, i64 %t478, i64 %t479, i64 %t480, i64 %t481, i64 %t482, i64 %t483, i64 %t484, i64 999)
  store i64 %t485, ptr %local.l3.358
  %t486 = load i64, ptr %local.t0.338
  %t487 = load i64, ptr %local.t1.339
  %t488 = load i64, ptr %local.t2.340
  %t489 = load i64, ptr %local.t3.341
  %t490 = load i64, ptr %local.u0.342
  %t491 = load i64, ptr %local.u1.343
  %t492 = load i64, ptr %local.u2.344
  %t493 = load i64, ptr %local.u3.345
  %t494 = load i64, ptr %local.v0.346
  %t495 = load i64, ptr %local.v1.347
  %t496 = load i64, ptr %local.v2.348
  %t497 = load i64, ptr %local.v3.349
  %t498 = load i64, ptr %local.amp.352
  %t499 = load i64, ptr %local.steps.350
  %t500 = load i64, ptr %local.lr.351
  %t501 = call i64 @"train_with_noise"(i64 %t486, i64 %t487, i64 %t488, i64 %t489, i64 %t490, i64 %t491, i64 %t492, i64 %t493, i64 %t494, i64 %t495, i64 %t496, i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 2024)
  store i64 %t501, ptr %local.l4.359
  %t502 = load i64, ptr %local.t0.338
  %t503 = load i64, ptr %local.t1.339
  %t504 = load i64, ptr %local.t2.340
  %t505 = load i64, ptr %local.t3.341
  %t506 = load i64, ptr %local.u0.342
  %t507 = load i64, ptr %local.u1.343
  %t508 = load i64, ptr %local.u2.344
  %t509 = load i64, ptr %local.u3.345
  %t510 = load i64, ptr %local.v0.346
  %t511 = load i64, ptr %local.v1.347
  %t512 = load i64, ptr %local.v2.348
  %t513 = load i64, ptr %local.v3.349
  %t514 = load i64, ptr %local.amp.352
  %t515 = load i64, ptr %local.steps.350
  %t516 = load i64, ptr %local.lr.351
  %t517 = call i64 @"train_with_noise"(i64 %t502, i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 %t514, i64 %t515, i64 %t516, i64 7777)
  store i64 %t517, ptr %local.l5.360
  %t518 = load i64, ptr %local.l1.356
  %t519 = load i64, ptr %local.l2.357
  %t520 = call i64 @"sx_f64_add"(i64 %t518, i64 %t519)
  %t521 = load i64, ptr %local.l3.358
  %t522 = call i64 @"sx_f64_add"(i64 %t520, i64 %t521)
  %t523 = load i64, ptr %local.l4.359
  %t524 = call i64 @"sx_f64_add"(i64 %t522, i64 %t523)
  %t525 = load i64, ptr %local.l5.360
  %t526 = call i64 @"sx_f64_add"(i64 %t524, i64 %t525)
  %t527 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.76)
  %t528 = call i64 @"sx_f64_div"(i64 %t526, i64 %t527)
  store i64 %t528, ptr %local.avg_loss.361
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.77)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_print(ptr %t531)
  %t532 = load i64, ptr %local.amp.352
  %t533 = call i64 @"print_f64"(i64 %t532)
  %t534 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.78)
  %t535 = ptrtoint ptr %t534 to i64
  %t536 = inttoptr i64 %t535 to ptr
  call void @intrinsic_print(ptr %t536)
  %t537 = load i64, ptr %local.avg_loss.361
  %t538 = call i64 @"print_f64"(i64 %t537)
  %t539 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.79)
  %t540 = ptrtoint ptr %t539 to i64
  %t541 = inttoptr i64 %t540 to ptr
  call void @intrinsic_println(ptr %t541)
  %t542 = load i64, ptr %local.avg_loss.361
  %t543 = load i64, ptr %local.best_loss.354
  %t544 = call i64 @"sx_f64_lt"(i64 %t542, i64 %t543)
  %t545 = icmp ne i64 %t544, 0
  br i1 %t545, label %then4, label %else4
then4:
  %t546 = load i64, ptr %local.avg_loss.361
  store i64 %t546, ptr %local.best_loss.354
  %t547 = load i64, ptr %local.amp.352
  store i64 %t547, ptr %local.best_amp.353
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t548 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t549 = load i64, ptr %local.sweep.355
  %t550 = add i64 %t549, 1
  store i64 %t550, ptr %local.sweep.355
  br label %loop3
endloop3:
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.80)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_println(ptr %t553)
  %t554 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.81)
  %t555 = ptrtoint ptr %t554 to i64
  %t556 = inttoptr i64 %t555 to ptr
  call void @intrinsic_print(ptr %t556)
  %t557 = load i64, ptr %local.best_amp.353
  %t558 = call i64 @"print_f64"(i64 %t557)
  %t559 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.82)
  %t560 = ptrtoint ptr %t559 to i64
  %t561 = inttoptr i64 %t560 to ptr
  call void @intrinsic_print(ptr %t561)
  %t562 = load i64, ptr %local.best_loss.354
  %t563 = call i64 @"print_f64"(i64 %t562)
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.83)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_println(ptr %t566)
  %t567 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.84)
  %t568 = ptrtoint ptr %t567 to i64
  %t569 = inttoptr i64 %t568 to ptr
  call void @intrinsic_println(ptr %t569)
  %t570 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.85)
  %t571 = ptrtoint ptr %t570 to i64
  %t572 = inttoptr i64 %t571 to ptr
  call void @intrinsic_println(ptr %t572)
  %t573 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.86)
  store i64 %t573, ptr %local.learned_amp.362
  store i64 0, ptr %local.cycle.363
  %t574 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.87)
  store i64 %t574, ptr %local.mg.364
  %t575 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.88)
  store i64 %t575, ptr %local.h.365
  %t576 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.89)
  store i64 %t576, ptr %local.meta_lr.366
  br label %loop5
loop5:
  %t577 = load i64, ptr %local.cycle.363
  %t578 = icmp slt i64 %t577, 30
  %t579 = zext i1 %t578 to i64
  %t580 = icmp ne i64 %t579, 0
  br i1 %t580, label %body5, label %endloop5
body5:
  %t581 = load i64, ptr %local.t0.338
  %t582 = load i64, ptr %local.t1.339
  %t583 = load i64, ptr %local.t2.340
  %t584 = load i64, ptr %local.t3.341
  %t585 = load i64, ptr %local.u0.342
  %t586 = load i64, ptr %local.u1.343
  %t587 = load i64, ptr %local.u2.344
  %t588 = load i64, ptr %local.u3.345
  %t589 = load i64, ptr %local.v0.346
  %t590 = load i64, ptr %local.v1.347
  %t591 = load i64, ptr %local.v2.348
  %t592 = load i64, ptr %local.v3.349
  %t593 = load i64, ptr %local.learned_amp.362
  %t594 = load i64, ptr %local.h.365
  %t595 = call i64 @"sx_f64_add"(i64 %t593, i64 %t594)
  %t596 = load i64, ptr %local.steps.350
  %t597 = load i64, ptr %local.lr.351
  %t598 = call i64 @"train_with_noise"(i64 %t581, i64 %t582, i64 %t583, i64 %t584, i64 %t585, i64 %t586, i64 %t587, i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 %t592, i64 %t595, i64 %t596, i64 %t597, i64 42)
  store i64 %t598, ptr %local.lp1.367
  %t599 = load i64, ptr %local.t0.338
  %t600 = load i64, ptr %local.t1.339
  %t601 = load i64, ptr %local.t2.340
  %t602 = load i64, ptr %local.t3.341
  %t603 = load i64, ptr %local.u0.342
  %t604 = load i64, ptr %local.u1.343
  %t605 = load i64, ptr %local.u2.344
  %t606 = load i64, ptr %local.u3.345
  %t607 = load i64, ptr %local.v0.346
  %t608 = load i64, ptr %local.v1.347
  %t609 = load i64, ptr %local.v2.348
  %t610 = load i64, ptr %local.v3.349
  %t611 = load i64, ptr %local.learned_amp.362
  %t612 = load i64, ptr %local.h.365
  %t613 = call i64 @"sx_f64_add"(i64 %t611, i64 %t612)
  %t614 = load i64, ptr %local.steps.350
  %t615 = load i64, ptr %local.lr.351
  %t616 = call i64 @"train_with_noise"(i64 %t599, i64 %t600, i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 %t607, i64 %t608, i64 %t609, i64 %t610, i64 %t613, i64 %t614, i64 %t615, i64 137)
  store i64 %t616, ptr %local.lp2.368
  %t617 = load i64, ptr %local.t0.338
  %t618 = load i64, ptr %local.t1.339
  %t619 = load i64, ptr %local.t2.340
  %t620 = load i64, ptr %local.t3.341
  %t621 = load i64, ptr %local.u0.342
  %t622 = load i64, ptr %local.u1.343
  %t623 = load i64, ptr %local.u2.344
  %t624 = load i64, ptr %local.u3.345
  %t625 = load i64, ptr %local.v0.346
  %t626 = load i64, ptr %local.v1.347
  %t627 = load i64, ptr %local.v2.348
  %t628 = load i64, ptr %local.v3.349
  %t629 = load i64, ptr %local.learned_amp.362
  %t630 = load i64, ptr %local.h.365
  %t631 = call i64 @"sx_f64_sub"(i64 %t629, i64 %t630)
  %t632 = load i64, ptr %local.steps.350
  %t633 = load i64, ptr %local.lr.351
  %t634 = call i64 @"train_with_noise"(i64 %t617, i64 %t618, i64 %t619, i64 %t620, i64 %t621, i64 %t622, i64 %t623, i64 %t624, i64 %t625, i64 %t626, i64 %t627, i64 %t628, i64 %t631, i64 %t632, i64 %t633, i64 42)
  store i64 %t634, ptr %local.lm1.369
  %t635 = load i64, ptr %local.t0.338
  %t636 = load i64, ptr %local.t1.339
  %t637 = load i64, ptr %local.t2.340
  %t638 = load i64, ptr %local.t3.341
  %t639 = load i64, ptr %local.u0.342
  %t640 = load i64, ptr %local.u1.343
  %t641 = load i64, ptr %local.u2.344
  %t642 = load i64, ptr %local.u3.345
  %t643 = load i64, ptr %local.v0.346
  %t644 = load i64, ptr %local.v1.347
  %t645 = load i64, ptr %local.v2.348
  %t646 = load i64, ptr %local.v3.349
  %t647 = load i64, ptr %local.learned_amp.362
  %t648 = load i64, ptr %local.h.365
  %t649 = call i64 @"sx_f64_sub"(i64 %t647, i64 %t648)
  %t650 = load i64, ptr %local.steps.350
  %t651 = load i64, ptr %local.lr.351
  %t652 = call i64 @"train_with_noise"(i64 %t635, i64 %t636, i64 %t637, i64 %t638, i64 %t639, i64 %t640, i64 %t641, i64 %t642, i64 %t643, i64 %t644, i64 %t645, i64 %t646, i64 %t649, i64 %t650, i64 %t651, i64 137)
  store i64 %t652, ptr %local.lm2.370
  %t653 = load i64, ptr %local.lp1.367
  %t654 = load i64, ptr %local.lp2.368
  %t655 = call i64 @"sx_f64_add"(i64 %t653, i64 %t654)
  %t656 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.90)
  %t657 = call i64 @"sx_f64_div"(i64 %t655, i64 %t656)
  store i64 %t657, ptr %local.avg_p.371
  %t658 = load i64, ptr %local.lm1.369
  %t659 = load i64, ptr %local.lm2.370
  %t660 = call i64 @"sx_f64_add"(i64 %t658, i64 %t659)
  %t661 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.91)
  %t662 = call i64 @"sx_f64_div"(i64 %t660, i64 %t661)
  store i64 %t662, ptr %local.avg_m.372
  %t663 = load i64, ptr %local.avg_p.371
  %t664 = load i64, ptr %local.avg_m.372
  %t665 = call i64 @"sx_f64_sub"(i64 %t663, i64 %t664)
  %t666 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.92)
  %t667 = load i64, ptr %local.h.365
  %t668 = call i64 @"sx_f64_mul"(i64 %t666, i64 %t667)
  %t669 = call i64 @"sx_f64_div"(i64 %t665, i64 %t668)
  store i64 %t669, ptr %local.mg.364
  %t670 = load i64, ptr %local.learned_amp.362
  %t671 = load i64, ptr %local.meta_lr.366
  %t672 = load i64, ptr %local.mg.364
  %t673 = call i64 @"sx_f64_mul"(i64 %t671, i64 %t672)
  %t674 = call i64 @"sx_f64_sub"(i64 %t670, i64 %t673)
  store i64 %t674, ptr %local.learned_amp.362
  %t675 = load i64, ptr %local.learned_amp.362
  %t676 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.93)
  %t677 = call i64 @"sx_f64_lt"(i64 %t675, i64 %t676)
  %t678 = icmp ne i64 %t677, 0
  br i1 %t678, label %then6, label %else6
then6:
  %t679 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.94)
  store i64 %t679, ptr %local.learned_amp.362
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t680 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t681 = load i64, ptr %local.learned_amp.362
  %t682 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.95)
  %t683 = call i64 @"sx_f64_gt"(i64 %t681, i64 %t682)
  %t684 = icmp ne i64 %t683, 0
  br i1 %t684, label %then7, label %else7
then7:
  %t685 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.96)
  store i64 %t685, ptr %local.learned_amp.362
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t686 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t687 = load i64, ptr %local.cycle.363
  %t688 = icmp slt i64 %t687, 3
  %t689 = zext i1 %t688 to i64
  %t690 = icmp ne i64 %t689, 0
  br i1 %t690, label %then8, label %else8
then8:
  %t691 = load i64, ptr %local.t0.338
  %t692 = load i64, ptr %local.t1.339
  %t693 = load i64, ptr %local.t2.340
  %t694 = load i64, ptr %local.t3.341
  %t695 = load i64, ptr %local.u0.342
  %t696 = load i64, ptr %local.u1.343
  %t697 = load i64, ptr %local.u2.344
  %t698 = load i64, ptr %local.u3.345
  %t699 = load i64, ptr %local.v0.346
  %t700 = load i64, ptr %local.v1.347
  %t701 = load i64, ptr %local.v2.348
  %t702 = load i64, ptr %local.v3.349
  %t703 = load i64, ptr %local.learned_amp.362
  %t704 = load i64, ptr %local.steps.350
  %t705 = load i64, ptr %local.lr.351
  %t706 = call i64 @"train_with_noise"(i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700, i64 %t701, i64 %t702, i64 %t703, i64 %t704, i64 %t705, i64 42)
  store i64 %t706, ptr %local.cl.373
  %t707 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.97)
  %t708 = ptrtoint ptr %t707 to i64
  %t709 = inttoptr i64 %t708 to ptr
  call void @intrinsic_print(ptr %t709)
  %t710 = load i64, ptr %local.cycle.363
  call void @print_i64(i64 %t710)
  %t711 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.98)
  %t712 = ptrtoint ptr %t711 to i64
  %t713 = inttoptr i64 %t712 to ptr
  call void @intrinsic_print(ptr %t713)
  %t714 = load i64, ptr %local.learned_amp.362
  %t715 = call i64 @"print_f64"(i64 %t714)
  %t716 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.99)
  %t717 = ptrtoint ptr %t716 to i64
  %t718 = inttoptr i64 %t717 to ptr
  call void @intrinsic_print(ptr %t718)
  %t719 = load i64, ptr %local.cl.373
  %t720 = call i64 @"print_f64"(i64 %t719)
  %t721 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.100)
  %t722 = ptrtoint ptr %t721 to i64
  %t723 = inttoptr i64 %t722 to ptr
  call void @intrinsic_print(ptr %t723)
  %t724 = load i64, ptr %local.mg.364
  %t725 = call i64 @"print_f64"(i64 %t724)
  %t726 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.101)
  %t727 = ptrtoint ptr %t726 to i64
  %t728 = inttoptr i64 %t727 to ptr
  call void @intrinsic_println(ptr %t728)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t729 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t730 = load i64, ptr %local.cycle.363
  %t731 = icmp eq i64 %t730, 29
  %t732 = zext i1 %t731 to i64
  %t733 = icmp ne i64 %t732, 0
  br i1 %t733, label %then9, label %else9
then9:
  %t734 = load i64, ptr %local.t0.338
  %t735 = load i64, ptr %local.t1.339
  %t736 = load i64, ptr %local.t2.340
  %t737 = load i64, ptr %local.t3.341
  %t738 = load i64, ptr %local.u0.342
  %t739 = load i64, ptr %local.u1.343
  %t740 = load i64, ptr %local.u2.344
  %t741 = load i64, ptr %local.u3.345
  %t742 = load i64, ptr %local.v0.346
  %t743 = load i64, ptr %local.v1.347
  %t744 = load i64, ptr %local.v2.348
  %t745 = load i64, ptr %local.v3.349
  %t746 = load i64, ptr %local.learned_amp.362
  %t747 = load i64, ptr %local.steps.350
  %t748 = load i64, ptr %local.lr.351
  %t749 = call i64 @"train_with_noise"(i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739, i64 %t740, i64 %t741, i64 %t742, i64 %t743, i64 %t744, i64 %t745, i64 %t746, i64 %t747, i64 %t748, i64 42)
  store i64 %t749, ptr %local.cl.374
  %t750 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.102)
  %t751 = ptrtoint ptr %t750 to i64
  %t752 = inttoptr i64 %t751 to ptr
  call void @intrinsic_print(ptr %t752)
  %t753 = load i64, ptr %local.learned_amp.362
  %t754 = call i64 @"print_f64"(i64 %t753)
  %t755 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.103)
  %t756 = ptrtoint ptr %t755 to i64
  %t757 = inttoptr i64 %t756 to ptr
  call void @intrinsic_print(ptr %t757)
  %t758 = load i64, ptr %local.cl.374
  %t759 = call i64 @"print_f64"(i64 %t758)
  %t760 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.104)
  %t761 = ptrtoint ptr %t760 to i64
  %t762 = inttoptr i64 %t761 to ptr
  call void @intrinsic_println(ptr %t762)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t763 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t764 = load i64, ptr %local.cycle.363
  %t765 = add i64 %t764, 1
  store i64 %t765, ptr %local.cycle.363
  br label %loop5
endloop5:
  %t766 = load i64, ptr %local.t0.338
  %t767 = load i64, ptr %local.t1.339
  %t768 = load i64, ptr %local.t2.340
  %t769 = load i64, ptr %local.t3.341
  %t770 = load i64, ptr %local.u0.342
  %t771 = load i64, ptr %local.u1.343
  %t772 = load i64, ptr %local.u2.344
  %t773 = load i64, ptr %local.u3.345
  %t774 = load i64, ptr %local.v0.346
  %t775 = load i64, ptr %local.v1.347
  %t776 = load i64, ptr %local.v2.348
  %t777 = load i64, ptr %local.v3.349
  %t778 = load i64, ptr %local.learned_amp.362
  %t779 = load i64, ptr %local.steps.350
  %t780 = load i64, ptr %local.lr.351
  %t781 = call i64 @"train_with_noise"(i64 %t766, i64 %t767, i64 %t768, i64 %t769, i64 %t770, i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777, i64 %t778, i64 %t779, i64 %t780, i64 42)
  store i64 %t781, ptr %local.final_loss.375
  %t782 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.105)
  %t783 = ptrtoint ptr %t782 to i64
  %t784 = inttoptr i64 %t783 to ptr
  call void @intrinsic_println(ptr %t784)
  %t785 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.106)
  %t786 = ptrtoint ptr %t785 to i64
  %t787 = inttoptr i64 %t786 to ptr
  call void @intrinsic_println(ptr %t787)
  %t788 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.107)
  %t789 = ptrtoint ptr %t788 to i64
  %t790 = inttoptr i64 %t789 to ptr
  call void @intrinsic_print(ptr %t790)
  %t791 = load i64, ptr %local.t0.338
  %t792 = load i64, ptr %local.t1.339
  %t793 = load i64, ptr %local.t2.340
  %t794 = load i64, ptr %local.t3.341
  %t795 = load i64, ptr %local.u0.342
  %t796 = load i64, ptr %local.u1.343
  %t797 = load i64, ptr %local.u2.344
  %t798 = load i64, ptr %local.u3.345
  %t799 = load i64, ptr %local.v0.346
  %t800 = load i64, ptr %local.v1.347
  %t801 = load i64, ptr %local.v2.348
  %t802 = load i64, ptr %local.v3.349
  %t803 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.108)
  %t804 = load i64, ptr %local.steps.350
  %t805 = load i64, ptr %local.lr.351
  %t806 = call i64 @"train_with_noise"(i64 %t791, i64 %t792, i64 %t793, i64 %t794, i64 %t795, i64 %t796, i64 %t797, i64 %t798, i64 %t799, i64 %t800, i64 %t801, i64 %t802, i64 %t803, i64 %t804, i64 %t805, i64 42)
  %t807 = call i64 @"print_f64"(i64 %t806)
  %t808 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.109)
  %t809 = ptrtoint ptr %t808 to i64
  %t810 = inttoptr i64 %t809 to ptr
  call void @intrinsic_println(ptr %t810)
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.110)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_print(ptr %t813)
  %t814 = load i64, ptr %local.best_amp.353
  %t815 = call i64 @"print_f64"(i64 %t814)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.111)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_print(ptr %t818)
  %t819 = load i64, ptr %local.best_loss.354
  %t820 = call i64 @"print_f64"(i64 %t819)
  %t821 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.112)
  %t822 = ptrtoint ptr %t821 to i64
  %t823 = inttoptr i64 %t822 to ptr
  call void @intrinsic_println(ptr %t823)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.113)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_print(ptr %t826)
  %t827 = load i64, ptr %local.learned_amp.362
  %t828 = call i64 @"print_f64"(i64 %t827)
  %t829 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.114)
  %t830 = ptrtoint ptr %t829 to i64
  %t831 = inttoptr i64 %t830 to ptr
  call void @intrinsic_print(ptr %t831)
  %t832 = load i64, ptr %local.final_loss.375
  %t833 = call i64 @"print_f64"(i64 %t832)
  %t834 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.115)
  %t835 = ptrtoint ptr %t834 to i64
  %t836 = inttoptr i64 %t835 to ptr
  call void @intrinsic_println(ptr %t836)
  %t837 = load i64, ptr %local.final_loss.375
  %t838 = load i64, ptr %local.t0.338
  %t839 = load i64, ptr %local.t1.339
  %t840 = load i64, ptr %local.t2.340
  %t841 = load i64, ptr %local.t3.341
  %t842 = load i64, ptr %local.u0.342
  %t843 = load i64, ptr %local.u1.343
  %t844 = load i64, ptr %local.u2.344
  %t845 = load i64, ptr %local.u3.345
  %t846 = load i64, ptr %local.v0.346
  %t847 = load i64, ptr %local.v1.347
  %t848 = load i64, ptr %local.v2.348
  %t849 = load i64, ptr %local.v3.349
  %t850 = call i64 @f64_parse(ptr @.str.exp_stochastic_projection.116)
  %t851 = load i64, ptr %local.steps.350
  %t852 = load i64, ptr %local.lr.351
  %t853 = call i64 @"train_with_noise"(i64 %t838, i64 %t839, i64 %t840, i64 %t841, i64 %t842, i64 %t843, i64 %t844, i64 %t845, i64 %t846, i64 %t847, i64 %t848, i64 %t849, i64 %t850, i64 %t851, i64 %t852, i64 42)
  %t854 = call i64 @"sx_f64_lt"(i64 %t837, i64 %t853)
  %t855 = icmp ne i64 %t854, 0
  br i1 %t855, label %then10, label %else10
then10:
  %t856 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.117)
  %t857 = ptrtoint ptr %t856 to i64
  %t858 = inttoptr i64 %t857 to ptr
  call void @intrinsic_println(ptr %t858)
  %t859 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.118)
  %t860 = ptrtoint ptr %t859 to i64
  %t861 = inttoptr i64 %t860 to ptr
  call void @intrinsic_println(ptr %t861)
  %t862 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.119)
  %t863 = ptrtoint ptr %t862 to i64
  %t864 = inttoptr i64 %t863 to ptr
  call void @intrinsic_println(ptr %t864)
  %t865 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.120)
  %t866 = ptrtoint ptr %t865 to i64
  %t867 = inttoptr i64 %t866 to ptr
  call void @intrinsic_println(ptr %t867)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t868 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.121)
  %t869 = ptrtoint ptr %t868 to i64
  %t870 = inttoptr i64 %t869 to ptr
  call void @intrinsic_println(ptr %t870)
  %t871 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_projection.122)
  %t872 = ptrtoint ptr %t871 to i64
  %t873 = inttoptr i64 %t872 to ptr
  call void @intrinsic_println(ptr %t873)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t874 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  ret i64 0
}


; String constants
@.str.exp_stochastic_projection.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.2 = private unnamed_addr constant [13 x i8] c"2147483647.0\00"
@.str.exp_stochastic_projection.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.23 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.25 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.26 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.28 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.29 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.35 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_projection.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.38 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_projection.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.41 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_projection.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.44 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stochastic_projection.45 = private unnamed_addr constant [24 x i8] c"  STOCHASTIC PROJECTION\00"
@.str.exp_stochastic_projection.46 = private unnamed_addr constant [43 x i8] c"  Breaking symmetry with intentional noise\00"
@.str.exp_stochastic_projection.47 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stochastic_projection.48 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.49 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stochastic_projection.50 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.51 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.52 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stochastic_projection.53 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_stochastic_projection.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.57 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stochastic_projection.58 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_stochastic_projection.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.60 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.62 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.63 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_stochastic_projection.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.65 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_projection.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.67 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_stochastic_projection.68 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_stochastic_projection.69 = private unnamed_addr constant [30 x i8] c"--- Noise amplitude sweep ---\00"
@.str.exp_stochastic_projection.70 = private unnamed_addr constant [37 x i8] c"  Amplitude    Loss (avg of 5 seeds)\00"
@.str.exp_stochastic_projection.71 = private unnamed_addr constant [37 x i8] c"  ----------   ---------------------\00"
@.str.exp_stochastic_projection.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.74 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_stochastic_projection.75 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_stochastic_projection.76 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stochastic_projection.77 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_stochastic_projection.78 = private unnamed_addr constant [9 x i8] c"        \00"
@.str.exp_stochastic_projection.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.81 = private unnamed_addr constant [19 x i8] c"  Best amplitude: \00"
@.str.exp_stochastic_projection.82 = private unnamed_addr constant [9 x i8] c"  loss: \00"
@.str.exp_stochastic_projection.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.85 = private unnamed_addr constant [41 x i8] c"--- Learning optimal noise amplitude ---\00"
@.str.exp_stochastic_projection.86 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_projection.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.88 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_stochastic_projection.89 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_stochastic_projection.90 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.92 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.96 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_projection.97 = private unnamed_addr constant [9 x i8] c"  cycle \00"
@.str.exp_stochastic_projection.98 = private unnamed_addr constant [7 x i8] c": amp=\00"
@.str.exp_stochastic_projection.99 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_stochastic_projection.100 = private unnamed_addr constant [7 x i8] c" grad=\00"
@.str.exp_stochastic_projection.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.102 = private unnamed_addr constant [17 x i8] c"  cycle 29: amp=\00"
@.str.exp_stochastic_projection.103 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_stochastic_projection.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.105 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.106 = private unnamed_addr constant [16 x i8] c"--- Summary ---\00"
@.str.exp_stochastic_projection.107 = private unnamed_addr constant [32 x i8] c"  Zero noise (deterministic):  \00"
@.str.exp_stochastic_projection.108 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.110 = private unnamed_addr constant [19 x i8] c"  Sweep best (amp=\00"
@.str.exp_stochastic_projection.111 = private unnamed_addr constant [5 x i8] c"):  \00"
@.str.exp_stochastic_projection.112 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.113 = private unnamed_addr constant [16 x i8] c"  Learned (amp=\00"
@.str.exp_stochastic_projection.114 = private unnamed_addr constant [8 x i8] c"):     \00"
@.str.exp_stochastic_projection.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_projection.117 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.118 = private unnamed_addr constant [50 x i8] c"  PASS: Stochastic projection beats deterministic\00"
@.str.exp_stochastic_projection.119 = private unnamed_addr constant [55 x i8] c"  Noise amplitude is a learnable dual-number parameter\00"
@.str.exp_stochastic_projection.120 = private unnamed_addr constant [36 x i8] c"  that breaks adversarial symmetry.\00"
@.str.exp_stochastic_projection.121 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_projection.122 = private unnamed_addr constant [66 x i8] c"  Noise did not help — objectives may not be adversarial enough\00"
